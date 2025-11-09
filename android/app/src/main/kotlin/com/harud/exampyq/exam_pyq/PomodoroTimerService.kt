package com.harud.exampyq.exam_pyq

import android.app.*
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.graphics.Color
import android.os.Build
import android.os.IBinder
import android.os.SystemClock
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import java.util.Timer
import java.util.TimerTask

class PomodoroTimerService : Service() {

    companion object {
        const val CHANNEL_ID = "pomodoro_timer_channel"
        const val NOTIFICATION_ID = 1
        const val ACTION_START = "ACTION_START"
        const val ACTION_PAUSE = "ACTION_PAUSE"
        const val ACTION_STOP = "ACTION_STOP"
        const val PREFS_NAME = "PomodoroPrefs"
        const val KEY_SESSION_ID = "last_session_id"
        const val KEY_TIME_SPENT = "last_session_time_spent"
        const val KEY_SESSION_ACTIVE = "session_active"
        const val KEY_PROJECT_NAME = "project_name"
        const val KEY_PROJECT_COLOR = "project_color"
        const val KEY_TOTAL_SECONDS = "total_seconds"
        const val KEY_START_TIME = "start_time_millis"
    }

    private var projectName = "Focus Session"
    private var totalSeconds = 1500
    private var projectColor = "FFFFC107" 
    private var chronometerBase: Long = 0
    private var isPaused = false
    private var pausedTime: Long = 0
    private var updateTimer: Timer? = null
    private var isAppInForeground = true
    private var sessionId: String = ""
    private var startTimeMillis: Long = 0
    private lateinit var sharedPrefs: SharedPreferences

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
        sharedPrefs = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        android.util.Log.d("PomodoroService", "Action received: ${intent?.action}")
        
        when (intent?.action) {
            "APP_IN_FOREGROUND" -> {
                isAppInForeground = true
                updateNotification()
            }
            "APP_IN_BACKGROUND" -> {
                isAppInForeground = false
                updateNotification()
            }
            ACTION_START -> {
                projectName = intent.getStringExtra("projectName") ?: "Focus Session"
                projectColor = intent.getStringExtra("projectColor") ?: "FFFFC107"
                sessionId = intent.getStringExtra("sessionId") ?: ""
                totalSeconds = intent.getIntExtra("totalSeconds", 1500)
                chronometerBase = SystemClock.elapsedRealtime() + (totalSeconds * 1000L)
                isPaused = false
                isAppInForeground = true
                
                // Save start time
                startTimeMillis = System.currentTimeMillis()
                
                // Mark session as active and save initial data
                sharedPrefs.edit()
                    .putBoolean(KEY_SESSION_ACTIVE, true)
                    .putString(KEY_SESSION_ID, sessionId)
                    .putString(KEY_PROJECT_NAME, projectName)
                    .putString(KEY_PROJECT_COLOR, projectColor)
                    .putInt(KEY_TIME_SPENT, 0)
                    .putInt(KEY_TOTAL_SECONDS, totalSeconds)
                    .putLong(KEY_START_TIME, startTimeMillis)
                    .apply()
                
                startForeground(NOTIFICATION_ID, createNotification())
                startUpdateTimer()
                broadcastStateChange()
                android.util.Log.d("PomodoroService", "✅ Timer started - SessionID: $sessionId at $startTimeMillis")
            }
            ACTION_PAUSE -> {
                isPaused = !isPaused
                
                if (isPaused) {
                    pausedTime = SystemClock.elapsedRealtime()
                    stopUpdateTimer() 
                } else {
                    val pauseDuration = SystemClock.elapsedRealtime() - pausedTime
                    chronometerBase += pauseDuration
                    startUpdateTimer() 
                }
                updateNotification()
                broadcastStateChange()
            }
            ACTION_STOP -> {
                val isStillActive = sharedPrefs.getBoolean(KEY_SESSION_ACTIVE, false)
                
                if (isStillActive) {
                    // Calculate elapsed time
                    val timeSpent = getElapsedSeconds()
                    
                    android.util.Log.d("PomodoroService", "⏹️ Timer stopped:")
                    android.util.Log.d("PomodoroService", "  - Session ID: $sessionId")
                    android.util.Log.d("PomodoroService", "  - Time spent: $timeSpent seconds")
                    android.util.Log.d("PomodoroService", "  - Total seconds: $totalSeconds")
                    
                    // Save final time
                    sharedPrefs.edit()
                        .putInt(KEY_TIME_SPENT, timeSpent)
                        .putBoolean(KEY_SESSION_ACTIVE, false)
                        .apply()
                    
                    // Broadcast that timer was stopped
                    val stopIntent = Intent("com.harud.exampyq.TIMER_STOPPED")
                    stopIntent.putExtra("timeSpent", timeSpent)
                    stopIntent.putExtra("sessionId", sessionId)
                    sendBroadcast(stopIntent)
                } else {
                    android.util.Log.d("PomodoroService", "⏹️ Timer stop requested but session already inactive")
                }
                
                stopUpdateTimer()
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
            }
        }
        return START_STICKY
    }
    
    private fun getElapsedSeconds(): Int {
        // First, try using chronometerBase if service is still running
        if (chronometerBase > 0) {
            val remainingSeconds = if (isPaused) {
                (chronometerBase - pausedTime) / 1000
            } else {
                (chronometerBase - SystemClock.elapsedRealtime()) / 1000
            }
            
            val elapsedSeconds = (totalSeconds - remainingSeconds).toInt()
            
            // If value is reasonable, use it
            if (elapsedSeconds in 0..totalSeconds) {
                return elapsedSeconds
            }
        }
        
        // Fallback: Calculate from SharedPreferences start time
        val savedStartTime = sharedPrefs.getLong(KEY_START_TIME, 0)
        val savedTotalSeconds = sharedPrefs.getInt(KEY_TOTAL_SECONDS, 1500)
        
        if (savedStartTime > 0) {
            val currentTime = System.currentTimeMillis()
            val elapsedMillis = currentTime - savedStartTime
            val elapsedSeconds = (elapsedMillis / 1000).toInt()
            
            android.util.Log.d("PomodoroService", "📊 Calculated from saved time: ${elapsedSeconds}s (started at $savedStartTime)")
            
            // Clamp to totalSeconds
            return elapsedSeconds.coerceIn(0, savedTotalSeconds)
        }
        
        // Last resort: use saved value
        return sharedPrefs.getInt(KEY_TIME_SPENT, 0)
    }
    
    private fun saveProgressToPrefs() {
        val timeSpent = getElapsedSeconds()
        sharedPrefs.edit()
            .putInt(KEY_TIME_SPENT, timeSpent)
            .apply()
    }
    
    private fun broadcastStateChange() {
        val intent = Intent("com.harud.exampyq.TIMER_STATE_CHANGED")
        intent.putExtra("isPaused", isPaused)
        sendBroadcast(intent)
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID, "Pomodoro Timer", NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Shows Pomodoro timer progress"
            }
            getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
        }
    }

    private fun createNotification(): Notification {
        val notificationLayout = RemoteViews(packageName, R.layout.notification_timer_custom)
        val notificationColor = try {
            Color.parseColor("#$projectColor")
        } catch (e: IllegalArgumentException) {
            Color.parseColor("#FFFFC107")
        }

        val remainingSeconds = if (isPaused) {
            (chronometerBase - pausedTime) / 1000
        } else {
            (chronometerBase - SystemClock.elapsedRealtime()) / 1000
        }
        
        val minutes = remainingSeconds / 60
        val seconds = remainingSeconds % 60
        val timeText = String.format("%02d:%02d", minutes, seconds)
        
        val elapsedSeconds = totalSeconds - remainingSeconds
        val remainingMinutes = elapsedSeconds / 60
        val remainingSecsDisplay = elapsedSeconds % 60
        
        val progress = if (totalSeconds > 0) {
            (((totalSeconds - remainingSeconds).toFloat() / totalSeconds) * 100).toInt().coerceIn(0, 100)
        } else {
            0
        }

        // Auto-complete when timer reaches 0
        if (remainingSeconds <= 0) {
            // Check if session is still active before saving
            val isStillActive = sharedPrefs.getBoolean(KEY_SESSION_ACTIVE, false)
            
            if (isStillActive) {
                val finalTimeSpent = totalSeconds
                sharedPrefs.edit()
                    .putInt(KEY_TIME_SPENT, finalTimeSpent)
                    .putBoolean(KEY_SESSION_ACTIVE, false)
                    .apply()
                
                stopUpdateTimer()
                
                // Broadcast completion
                val completeIntent = Intent("com.harud.exampyq.TIMER_COMPLETED")
                completeIntent.putExtra("timeSpent", finalTimeSpent)
                completeIntent.putExtra("sessionId", sessionId)
                sendBroadcast(completeIntent)
                
                android.util.Log.d("PomodoroService", "✅ Timer completed! Total: $finalTimeSpent seconds")
            } else {
                android.util.Log.d("PomodoroService", "⏹️ Timer expired but session was already stopped")
                stopUpdateTimer()
            }
            
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
            
            // Return a dummy notification since service is stopping
            return NotificationCompat.Builder(this, CHANNEL_ID)
                .setSmallIcon(R.drawable.ic_timer)
                .setContentText("Timer completed")
                .build()
        }

        // Set project name with color
        notificationLayout.setTextViewText(R.id.notification_project_name, projectName)
        notificationLayout.setTextColor(R.id.notification_project_name, notificationColor)
        
        // Update timer text with color
        notificationLayout.setTextViewText(R.id.notification_timer, timeText)
        notificationLayout.setTextColor(R.id.notification_timer, notificationColor)
        
        // Update remaining time
        notificationLayout.setTextViewText(
            R.id.notification_remaining_time, 
            "- " + String.format("%02d:%02d", remainingMinutes, remainingSecsDisplay)
        )
        
        // Update progress bar
        notificationLayout.setProgressBar(R.id.notification_progress, 100, progress, false)

        // Create pending intents for actions
        val pauseIntent = Intent(this, PomodoroTimerService::class.java).apply {
            action = ACTION_PAUSE
        }
        val pausePendingIntent = PendingIntent.getService(
            this, 0, pauseIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val stopIntent = Intent(this, PomodoroTimerService::class.java).apply {
            action = ACTION_STOP
        }
        val stopPendingIntent = PendingIntent.getService(
            this, 1, stopIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // Click notification to open app
        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)
        val openAppPendingIntent = PendingIntent.getActivity(
            this, 0, openAppIntent, 
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_timer)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationLayout)
            .setCustomBigContentView(notificationLayout)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setContentIntent(openAppPendingIntent)
            .addAction(
                if (isPaused) R.drawable.ic_play else R.drawable.ic_pause,
                if (isPaused) "Resume" else "Pause",
                pausePendingIntent
            )

        // Only show Stop button when app is NOT in foreground
        if (!isAppInForeground) {
            builder.addAction(
                R.drawable.ic_stop,
                "Stop",
                stopPendingIntent
            )
        }

        return builder.build()
    }
    
    private fun updateNotification() {
        // Save progress every update
        saveProgressToPrefs()
        
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, createNotification())
    }

    private fun startUpdateTimer() {
        stopUpdateTimer()
        updateTimer = Timer()
        updateTimer?.scheduleAtFixedRate(object : TimerTask() {
            override fun run() {
                if (!isPaused) {
                    updateNotification()
                }
            }
        }, 0, 1000)
    }

    private fun stopUpdateTimer() {
        updateTimer?.cancel()
        updateTimer = null
    }

    override fun onDestroy() {
        stopUpdateTimer()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}
