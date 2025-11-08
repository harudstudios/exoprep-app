package com.harud.exampyq.exam_pyq

import android.app.*
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.os.SystemClock
import android.util.Log
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import java.util.Timer

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
    private var projectColor = "FF9800"
    private var chronometerBase: Long = 0
    private var isPaused = false
    private var pausedTime: Long = 0
    private var updateTimer: Timer? = null

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> {
                projectName = intent.getStringExtra("projectName") ?: "Focus Session"
                projectColor = intent.getStringExtra("projectColor") ?: "FF9800"
                totalSeconds = intent.getIntExtra("totalSeconds", 1500)
                chronometerBase = SystemClock.elapsedRealtime() + (totalSeconds * 1000L)
                isPaused = false
                startForeground(NOTIFICATION_ID, createNotification())
                startUpdateTimer()
            }
            ACTION_PAUSE -> {
                isPaused = !isPaused
                if (isPaused) {
                    pausedTime = SystemClock.elapsedRealtime()
                } else {
                    val pauseDuration = SystemClock.elapsedRealtime() - pausedTime
                    chronometerBase += pauseDuration
                }
                (getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
                    .notify(NOTIFICATION_ID, createNotification())
            }
            ACTION_STOP -> {
                stopUpdateTimer()
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
            }
        }
        return START_STICKY
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID, "Pomodoro Timer", NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Shows Pomodoro timer progress"
                setSound(null, null)
            }
            getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
        }
    }

    private fun createNotification(): Notification {
        val remaining = (chronometerBase - SystemClock.elapsedRealtime()) / 1000
        val minutes = remaining / 60
        val seconds = remaining % 60
        val timeText = String.format("%02d:%02d", minutes, seconds)
        val progress = (((totalSeconds - remaining.toInt()).toFloat() / totalSeconds) * 100).toInt().coerceIn(0, 100)

        val intent = packageManager.getLaunchIntentForPackage(packageName)
        val pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)

        val notificationColor = try {
            android.graphics.Color.parseColor("#$projectColor")
        } catch (e: Exception) {
            android.graphics.Color.parseColor("#FF9800")
        }

        // Create the custom layout view
        val notificationLayout = RemoteViews(packageName, R.layout.notification_timer_custom)

        // Directly set the text and color for the title and timer
        notificationLayout.setTextViewText(R.id.notification_project_name, projectName)
        notificationLayout.setTextColor(R.id.notification_project_name, notificationColor)

        notificationLayout.setTextViewText(R.id.notification_timer, timeText)
        notificationLayout.setTextColor(R.id.notification_timer, notificationColor)

        // Update the progress bar
        notificationLayout.setProgressBar(R.id.notification_progress, 100, progress, false)

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_timer)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationLayout)
            .setCustomBigContentView(notificationLayout)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setContentIntent(pendingIntent)
            .setForegroundServiceBehavior(NotificationCompat.FOREGROUND_SERVICE_IMMEDIATE)
            .build()
    }

    private fun startUpdateTimer() {
        stopUpdateTimer()
        updateTimer = Timer()
        updateTimer!!.scheduleAtFixedRate(
            object : java.util.TimerTask() {
                override fun run() {
                    (getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
                        .notify(NOTIFICATION_ID, createNotification())
                }
            },
            1000,
            1000
        )
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
