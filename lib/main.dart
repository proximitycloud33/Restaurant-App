import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/app.dart';
import 'package:restaurant_app/services/background_service.dart';
import 'package:restaurant_app/services/notification_service.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = NotificationService();
  final backgroundService = BackgroundService();

  backgroundService.initIsolate();

  await notificationService.initNotificationsPlatform();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  runApp(const MyApp());
}
