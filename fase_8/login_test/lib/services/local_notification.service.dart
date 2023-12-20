import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationService() {
    _initialize();
  }

  void _initialize() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    if (notification == null) return;

    AndroidNotificationDetails? androidPlatformChannelSpecifics;

    if (notification.android != null) {
      androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'teste_channel_id',
        'Teste',
        importance: Importance.max,
        priority: Priority.max,
        icon: notification.android!.smallIcon,
      );
    }

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    _localNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: jsonEncode(message.data),
    );
  }

  void _onDidReceiveNotificationResponse(NotificationResponse notification) {
    if (notification.payload == null) return;

    final Map<String, dynamic> data = jsonDecode(notification.payload!);

    final String link = data['link'] ?? '';

    log('LINK RECEBIDO: $link');

    if (link.isNotEmpty) {
      // Navigator.of(kNavigatorKey.currentContext!).pushNamed("");
    }
  }
}
