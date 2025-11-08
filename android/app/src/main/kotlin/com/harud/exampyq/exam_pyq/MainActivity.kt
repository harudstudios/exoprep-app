package com.harud.exampyq.exam_pyq

import android.util.Log
import android.content.Intent
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.Manifest
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.harud.exampyq.exam_pyq/timer"
    private val NOTIFICATION_PERMISSION_CODE = 100
    private val TAG = "PomodoroDebug"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        Log.d(TAG, "=== CONFIGURING FLUTTER ENGINE ===")
        
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
                    
                    Log.d(TAG, "Arguments received:")
                    Log.d(TAG, "  totalSeconds: $totalSeconds")
                    Log.d(TAG, "  projectName: $projectName")
                    Log.d(TAG, "  projectColor: $projectColor")
                    
                    try {
                        startTimerService(totalSeconds, projectName, projectColor)
                        Log.d(TAG, "startTimerService completed successfully")
                        result.success(true)
                    } catch (e: Exception) {
                        Log.e(TAG, "Error starting timer service", e)
                        result.error("START_ERROR", e.message, null)
                    }
                }
                "pauseTimer" -> {
                    Log.d(TAG, "Pause timer called")
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
                else -> {
                    Log.w(TAG, "Unknown method: ${call.method}")
                    result.notImplemented()
                }
            }
        }
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

    private fun startTimerService(totalSeconds: Int, projectName: String, projectColor: String) {
        Log.d(TAG, "Creating service intent")
        
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = PomodoroTimerService.ACTION_START
            putExtra("totalSeconds", totalSeconds)
            putExtra("projectName", projectName)
            putExtra("projectColor", projectColor)
        }
        
        Log.d(TAG, "Intent created with extras:")
        Log.d(TAG, "  Action: ${intent.action}")
        Log.d(TAG, "  totalSeconds: ${intent.getIntExtra("totalSeconds", -1)}")
        Log.d(TAG, "  projectName: ${intent.getStringExtra("projectName")}")
        Log.d(TAG, "  projectColor: ${intent.getStringExtra("projectColor")}")
        
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                Log.d(TAG, "Starting foreground service (Android O+)")
                val result = startForegroundService(intent)
                Log.d(TAG, "startForegroundService result: $result")
            } else {
                Log.d(TAG, "Starting regular service (Android < O)")
                val result = startService(intent)
                Log.d(TAG, "startService result: $result")
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
        Log.d(TAG, "Pause intent sent")
    }

    private fun stopTimerService() {
        val intent = Intent(this, PomodoroTimerService::class.java).apply {
            action = PomodoroTimerService.ACTION_STOP
        }
        startService(intent)
        Log.d(TAG, "Stop intent sent")
    }
}