//package com.example.untitled
//
//import android.app.NotificationChannel
//import android.app.NotificationManager
//import android.app.PendingIntent
//import android.content.Context
//import android.content.Intent
//import android.media.RingtoneManager
//import android.net.Uri
//import android.os.Build
//import androidx.core.app.NotificationCompat
//import com.google.firebase.messaging.FirebaseMessagingService
//import com.google.firebase.messaging.RemoteMessage
//
//class MyFirebaseMessagingService : FirebaseMessagingService() {
//
//    override fun onMessageReceived(remoteMessage: RemoteMessage) {
//        super.onMessageReceived(remoteMessage)
//        println("native notification")
//        sendNotification(remoteMessage.notification?.title, remoteMessage.notification?.body)
//    }
//
//    private fun sendNotification(title: String?, messageBody: String?) {
//        val intent = Intent(this, MainActivity::class.java)
//        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
//        val pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_ONE_SHOT)
//
//        val soundUri = Uri.parse("android.resource://" + packageName + "/raw/notification")
//
//        val channelId = "default_channel_id"
//
//        val notificationBuilder = NotificationCompat.Builder(this, channelId)
//            .setSmallIcon(R.mipmap.ic_launcher)
//            .setContentTitle(title)
//            .setContentText(messageBody)
//            .setAutoCancel(true)
//            .setSound(soundUri)
//            .setContentIntent(pendingIntent)
//
//        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
//
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            val channel = NotificationChannel("default_channel_id", "Channel human readable title", NotificationManager.IMPORTANCE_DEFAULT)
//            notificationManager.createNotificationChannel(channel)
//        }
//
//        notificationManager.notify(0, notificationBuilder.build())
//    }
//}
