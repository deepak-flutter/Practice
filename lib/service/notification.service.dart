import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/modules/newsHome/view/newsHome.view.dart';
import 'package:untitled/modules/newsPage/view/newsPage.view.dart';
import 'package:untitled/utils/routes.util.dart';

class NotificationService {
  static final NotificationService _singleton = NotificationService._internal();
  late final NotificationService prefs;

  static NotificationService get instance => _singleton;

  factory NotificationService() {
    return _singleton;
  }

  NotificationService._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      print("User denied permission");
    }
  }

  subscribeToTopic() {
    messaging.subscribeToTopic("topic");
  }

  void initLocalNotifications(BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSetting, onDidReceiveNotificationResponse: (payload) {
      Logger().i("Foreground: $payload");
      handleMessage(context, message);
    });
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification?.title.toString());
      print(message.notification?.body.toString());
      print(message.data);
      print(message.data['type']);
      print(message.data['id']);

      if (Platform.isAndroid) {
        initLocalNotifications(Get.context!, message);
      }
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    Logger().i("showNotification: $message");
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      // 1.toString(),
      "High Importance Notification",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Your channel description",
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('notification'),
      category: AndroidNotificationCategory.recommendation,
      actions: [
        const AndroidNotificationAction("id", "title", inputs: [
          AndroidNotificationActionInput(allowFreeFormInput: true, label: "label"),
          AndroidNotificationActionInput(allowFreeFormInput: true, label: "label"),
        ]),
      ],
    );

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(
      0.milliseconds,
      () {
        flutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title.toString(),
          message.notification?.body.toString(),
          notificationDetails,
        );
      },
    );
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      print("Refresh token: ${event.toString()}");
    });
  }

  Future<void> setupInteractMessage() async {
    Future.delayed(
      300.milliseconds,
      () async {
        // when app is terminated
        RemoteMessage? initialMessage =
            await FirebaseMessaging.instance.getInitialMessage();

        if (initialMessage != null) {
          Logger().i("Terminated: $initialMessage");
          handleMessage(Get.context!, initialMessage);
        }

        // when app is in background
        FirebaseMessaging.onMessageOpenedApp.listen((event) {
          Logger().i("Background: $event");
          handleMessage(Get.context!, event);
        });
      },
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data["type"] == "message") {
      RoutesUtil.offAll(() => NewsPageView())
          .then((value) => RoutesUtil.offAll(() => NewsHomeView()));
    }
  }
}
