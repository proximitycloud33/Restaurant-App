import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/shared/global_navigation.dart';
import 'package:rxdart/rxdart.dart';

// global Stream, dont forget to dispose.
final selectNotificationSubject = BehaviorSubject<String>();

class NotificationService {
  //Singleton
  static final notificationService = NotificationService._internal();
  NotificationService._internal();
  factory NotificationService() => notificationService;

  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Channel
  static const String _channelId = "01";
  static const String _channelName = "Recommendation";
  static const String _channelDesc = "Restaurant recommendation";

  Future<void> initNotificationsPlatform() async {
    // initalize android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('dinner_dining');
    //initialize ios
    var initializationSettingsIos = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotifications,
    );
    // initalizeSetting
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

    // if the app was launched via notification then add stream
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
