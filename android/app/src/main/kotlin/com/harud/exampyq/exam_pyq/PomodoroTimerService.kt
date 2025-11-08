package com.harud.exampyq.exam_pyq

import android.app.*
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.GradientDrawable
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
    }

    private var projectName = "Focus Session"
    private var totalSeconds = 1500
    private var projectColor = "FFFFC107" 
    private var chronometerBase: Long = 0
    private var isPaused = false
    private var pausedTime: Long = 0
    private var updateTimer: Timer? = null

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        android.util.Log.d("PomodoroService", "Action received: ${intent?.action}, isPaused: $isPaused")
        
        when (intent?.action) {
            ACTION_START -> {
                projectName = intent.getStringExtra("projectName") ?: "Focus Session"
                projectColor = intent.getStringExtra("projectColor") ?: "FFFFC107"
                totalSeconds = intent.getIntExtra("totalSeconds", 1500)
                chronometerBase = SystemClock.elapsedRealtime() + (totalSeconds * 1000L)
                isPaused = false
                startForeground(NOTIFICATION_ID, createNotification())
                startUpdateTimer()
                broadcastStateChange()
                android.util.Log.d("PomodoroService", "Timer started")
            }
            ACTION_PAUSE -> {
                isPaused = !isPaused
                android.util.Log.d("PomodoroService", "Pause toggled. New state isPaused: $isPaused")
                
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
                stopUpdateTimer()
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
                android.util.Log.d("PomodoroService", "Timer stopped")
            }
        }
        return START_STICKY
    }
    
    private fun broadcastStateChange() {
        val intent = Intent("com.harud.exampyq.TIMER_STATE_CHANGED")
        intent.putExtra("isPaused", isPaused)
        sendBroadcast(intent)
        android.util.Log.d("PomodoroService", "📢 Broadcast sent: isPaused=$isPaused")
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

        val pauseIntent = Intent(this, PomodoroTimerService::class.java).apply { 
            action = ACTION_PAUSE 
        }
        val pausePendingIntent = PendingIntent.getService(
            this, 0, pauseIntent, 
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

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

        // Set project name with color
        notificationLayout.setTextViewText(R.id.notification_project_name, projectName)
        notificationLayout.setTextColor(R.id.notification_project_name, notificationColor)
        
        // Update timer text
        notificationLayout.setTextViewText(R.id.notification_timer, timeText)
        notificationLayout.setTextColor(R.id.notification_timer, notificationColor)
        
        // Update remaining time
        notificationLayout.setTextViewText(
            R.id.notification_remaining_time, 
            "- " + String.format("%02d:%02d", remainingMinutes, remainingSecsDisplay)
        )
        
        // Update progress bar
        notificationLayout.setProgressBar(R.id.notification_progress, 100, progress, false)
        
        // Set the correct icon based on pause state
        val iconRes = if (isPaused) R.drawable.ic_play else R.drawable.ic_pause
        notificationLayout.setImageViewResource(R.id.notification_play_pause_button, iconRes)
        
        // Set button click action
        // notificationLayout.setOnClickPendingIntent(R.id.notification_play_pause_button, pausePendingIntent)
        
        // Apply color to button background (not the icon)
        notificationLayout.setInt(R.id.notification_play_pause_button, "setBackgroundColor", notificationColor)

        val intent = packageManager.getLaunchIntentForPackage(packageName)
        val pendingIntent = PendingIntent.getActivity(
            this, 0, intent, 
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_timer)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationLayout)
            .setCustomBigContentView(notificationLayout)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setContentIntent(pendingIntent)
            .build()
    }
    
    private fun updateNotification() {
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
