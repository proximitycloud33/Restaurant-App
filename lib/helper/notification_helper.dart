import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

import 'package:restaurant_app/shared/global_navigation.dart';

// Global Stream, don't forget to dispose.
final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  //Singleton
  static final notificationService = NotificationHelper._internal();
  NotificationHelper._internal();
  factory NotificationHelper() => notificationService;

  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Channel
  static const String _channelId = "01";
  static const String _channelName = "Recommendation";
  static const String _channelDesc = "Restaurant recommendation";

  Future<void> initNotificationsPlatform() async {
    // Initialize android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('dinner_dining');
    //Initialize ios
    var initializationSettingsIos = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotifications,
    );
    // Initialize setting
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIos,
    );
    // try to initializeLocalNotifications
    try {
      await _localNotifications.initialize(
        initializationSettings,
        onSelectNotification: _onSelectNotification,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _onDidReceiveLocalNotifications(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    debugPrint('id $id');
  }

  void _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      //Add stream of payload if exist
      selectNotificationSubject.add(payload);
    }
  }

  Future<NotificationDetails> _notificationDetails() async {
    // Android Notification
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      enableLights: true,
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    //IOS Notification
    var iosPlatformChannelSpecifics = const IOSNotificationDetails();

    final details = await _localNotifications.getNotificationAppLaunchDetails();

    // if the app was launched via notification then add stream of payload
    if (details != null && details.didNotificationLaunchApp) {
      selectNotificationSubject.add(details.payload ?? 'Empty Payload');
    }
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    return platformChannelSpecifics;
  }

  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required String restaurantIdPayload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: restaurantIdPayload,
    );
  }

  void configureSelectNotificationSubject(String route) {
    // listen to the stream
    selectNotificationSubject.stream.listen(
      (String payload) async {
        GlobalNavigation.intentWithData(route, payload);
      },
    );
  }
}
