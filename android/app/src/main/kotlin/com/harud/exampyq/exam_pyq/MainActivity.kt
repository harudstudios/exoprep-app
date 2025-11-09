package com.harud.exampyq.exam_pyq

import android.util.Log
import android.content.Intent
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import android.Manifest
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.harud.exampyq.exam_pyq/timer"
    private val EVENT_CHANNEL = "com.harud.exampyq.exam_pyq/timer_events"
    private val NOTIFICATION_PERMISSION_CODE = 100
    private val TAG = "PomodoroDebug"
    
    private var eventSink: EventChannel.EventSink? = null
    private var isReceiverRegistered = false

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        Log.d(TAG, "=== CONFIGURING FLUTTER ENGINE ===")
        
        // Method Channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { 
            call, result ->
            
            Log.d(TAG, "Method called: ${call.method}")
            
            when (call.method) {
                "requestPermissions" -> {
                    Log.d(TAG, "Requesting permissions")
                    requestNotificationPermission()
                    result.success(true)
                }
                "startTimer" -> {
                    Log.d(TAG, "=== START TIMER CALLED FROM FLUTTER ===")
                    val totalSeconds = call.argument<Int>("totalSeconds") ?: 1500
                    val projectName = call.argument<String>("projectName") ?: "Focus"
                    val projectColor = call.argument<String>("projectColor") ?: "FFFF5252"
                    val sessionId = call.argument<String>("sessionId") ?: ""
                    
                    Log.d(TAG, "Arguments received:")
                    Log.d(TAG, "  totalSeconds: $totalSeconds")
                    Log.d(TAG, "  projectName: $projectName")
                    Log.d(TAG, "  projectColor: $projectColor")
                    Log.d(TAG, "  sessionId: $sessionId")
                    
                    try {
                        startTimerService(totalSeconds, projectName, projectColor, sessionId)
                        Log.d(TAG, "startTimerService completed successfully")
                        result.success(true)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error starting timer service", e)
                        result.error("START_ERROR", e.message, null)
                    }
                }
                "pauseTimer" -> {
                    Log.d(TAG, "Pause timer called from Flutter")
                    try {
                        pauseTimerService()
                        result.success(true)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error pausing timer", e)
                        result.error("PAUSE_ERROR", e.message, null)
                    }
                }
                "stopTimer" -> {
                    Log.d(TAG, "Stop timer called")
                    try {
                        stopTimerService()
                        result.success(true)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error stopping timer", e)
                        result.error("STOP_ERROR", e.message, null)
                    }
                }
               "getPendingSession" -> {
                    try {
                        val prefs = getSharedPreferences("PomodoroPrefs", Context.MODE_PRIVATE)
                        val isActive = prefs.getBoolean("session_active", false)
                        val sessionId = prefs.getString("last_session_id", "") ?: ""
                        val timeSpent = prefs.getInt("last_session_time_spent", 0)
                        val projectName = prefs.getString("project_name", "") ?: ""
                        val projectColor = prefs.getString("project_color", "") ?: ""
                        
                        // ALWAYS return the data, regardless of active status
                        val sessionData = mapOf(
                            "isActive" to isActive,
                            "sessionId" to sessionId,
                            "timeSpent" to timeSpent,
                            "projectName" to projectName,
                            "projectColor" to projectColor
                        )
                        
                        Log.d(TAG, "📦 Returning session data: isActive=$isActive, id=$sessionId, time=$timeSpent, name=$projectName")
                        result.success(sessionData)
                    } catch (e: Exception) {
                        Log.e(TAG, "❌ Error getting session: ${e.message}")
                        result.error("GET_SESSION_ERROR", e.message, null)
                    }
                }
                "clearPendingSession" -> {
                    try {
                        val prefs = getSharedPreferences("PomodoroPrefs", Context.MODE_PRIVATE)
                        prefs.edit()
                            .putBoolean("session_active", false)
                            .putString("last_session_id", "")
                            .putInt("last_session_time_spent", 0)
                            .putString("project_name", "")
                            .putString("project_color", "")
                            .apply()
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("CLEAR_SESSION_ERROR", e.message, null)
                    }
                }
                else -> {
                    Log.w(TAG, "Unknown method: ${call.method}")
                    result.notImplemented()
                }
            }
        }
        
        // Event Channel
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                    Log.d(TAG, "Event channel listener attached")
                    registerTimerReceiver()
                }

                override fun onCancel(arguments: Any?) {
                    eventSink = null
                    Log.d(TAG, "Event channel listener cancelled")
                    unregisterTimerReceiver()
                }
            }
        )
    }
    
    private fun registerTimerReceiver() {
        if (!isReceiverRegistered) {
            val filter = IntentFilter().apply {
                addAction("com.harud.exampyq.TIMER_STATE_CHANGED")
                addAction("com.harud.exampyq.TIMER_STOPPED")
                addAction("com.harud.exampyq.TIMER_COMPLETED")
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                registerReceiver(timerStateReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
            } else {
                registerReceiver(timerStateReceiver, filter)
            }
            isReceiverRegistered = true
            Log.d(TAG, "Timer receiver registered")
        }
    }
    
    private fun unregisterTimerReceiver() {
        if (isReceiverRegistered) {
            try {
                unregisterReceiver(timerStateReceiver)
                isReceiverRegistered = false
                Log.d(TAG, "Timer receiver unregistered")
            } catch (e: Exception) {
                Log.e(TAG, "Error unregistering receiver", e)
            }
        }
    }
    
    private val timerStateReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            when (intent?.action) {
                "com.harud.exampyq.TIMER_STATE_CHANGED" -> {
                    val isPaused = intent.getBooleanExtra("isPaused", false)
                    Log.d(TAG, "🔔 Received timer state change broadcast: isPaused=$isPaused")
                    eventSink?.success(mapOf("isPaused" to isPaused))
                }
                "com.harud.exampyq.TIMER_STOPPED" -> {
                    val timeSpent = intent.getIntExtra("timeSpent", 0)
                    val sessionId = intent.getStringExtra("sessionId")
                    Log.d(TAG, "🔔 Received timer stopped broadcast")
                    eventSink?.success(mapOf(
                        "stopped" to true,
                        "timeSpent" to timeSpent,
                        "sessionId" to sessionId
                    ))
                }
                "com.harud.exampyq.TIMER_COMPLETED" -> {
                    val timeSpent = intent.getIntExtra("timeSpent", 0)
                    val sessionId = intent.getStringExtra("sessionId")
                    Log.d(TAG, "🔔 Received timer completed broadcast")
                    eventSink?.success(mapOf(
                        "completed" to true,
                        "timeSpent" to timeSpent,
                        "sessionId" to sessionId
                    ))
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        // Tell service that app is in foreground
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = "APP_IN_FOREGROUND"
        }
        try {
            startService(intent)
            Log.d(TAG, "App resumed - notified service")
        } catch (e: Exception) {
            Log.e(TAG, "Error notifying service on resume", e)
        }
    }

    override fun onPause() {
        super.onPause()
        // Tell service that app is in background
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = "APP_IN_BACKGROUND"
        }
        try {
            startService(intent)
            Log.d(TAG, "App paused - notified service")
        } catch (e: Exception) {
            Log.e(TAG, "Error notifying service on pause", e)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterTimerReceiver()
    }

    private fun requestNotificationPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val hasPermission = ContextCompat.checkSelfPermission(
                this, 
                Manifest.permission.POST_NOTIFICATIONS
            ) == PackageManager.PERMISSION_GRANTED
            
            Log.d(TAG, "POST_NOTIFICATIONS permission: $hasPermission")
            
            if (!hasPermission) {
                Log.d(TAG, "Requesting POST_NOTIFICATIONS permission")
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                    NOTIFICATION_PERMISSION_CODE
                )
            }
        } else {
            Log.d(TAG, "Android version < 13, no POST_NOTIFICATIONS needed")
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        
        if (requestCode == NOTIFICATION_PERMISSION_CODE) {
            val granted = grantResults.isNotEmpty() && 
                         grantResults[0] == PackageManager.PERMISSION_GRANTED
            Log.d(TAG, "Notification permission result: $granted")
        }
    }

    private fun startTimerService(totalSeconds: Int, projectName: String, projectColor: String, sessionId: String) {
        Log.d(TAG, "Creating service intent")
        
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = PomodoroTimerService.ACTION_START
            putExtra("totalSeconds", totalSeconds)
            putExtra("projectName", projectName)
            putExtra("projectColor", projectColor)
            putExtra("sessionId", sessionId)
        }
        
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                Log.d(TAG, "Starting foreground service (Android O+)")
                startForegroundService(intent)
            } else {
                Log.d(TAG, "Starting regular service (Android < O)")
                startService(intent)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Exception starting service", e)
            throw e
        }
    }

    private fun pauseTimerService() {
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = PomodoroTimerService.ACTION_PAUSE
        }
        startService(intent)
        Log.d(TAG, "Pause intent sent from Flutter")
    }

    private fun stopTimerService() {
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = PomodoroTimerService.ACTION_STOP
        }
        startService(intent)
        Log.d(TAG, "Stop intent sent")
    }
}
