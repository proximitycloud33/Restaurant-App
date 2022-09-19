import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/helper/notification_helper.dart';

final port = ReceivePort();

class BackgroundService {
  // singleton
  static final _backgroundService = BackgroundService._internal();
  BackgroundService._internal();
  factory BackgroundService() => _backgroundService;

  //isolate
  static const String _isolateName = 'backgroundServiceIsolate';
  static SendPort? _uiSendPort;

  void initIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  // callback can't have parameter
  static Future<void> callback() async {
    debugPrint('Alarm Fired');

    var listData = await ApiService().getRestaurantListData();
    var randomIndex = Random().nextInt(listData.restaurants.length);

    String restaurantId = listData.restaurants[randomIndex].id;
    var detailData = await ApiService().getRestaurantDetailData(restaurantId);

    final notificationService = NotificationHelper();
    await notificationService.showLocalNotification(
      id: 1,
      title: detailData.restaurant.name,
      body: 'Restaurant recommendation for you today, tap to view',
      restaurantIdPayload: restaurantId,
    );
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
