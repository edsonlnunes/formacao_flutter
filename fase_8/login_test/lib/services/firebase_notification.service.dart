import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification.service.dart';

class FirebaseNotificationService {
  final LocalNotificationService _notificationService;

  FirebaseNotificationService({
    required LocalNotificationService localNotificationService,
  }) : _notificationService = localNotificationService;

  Future<void> initilize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _getDeviceFirebaseToken();

    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessage.listen(_notificationService.showNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }

  void _getDeviceFirebaseToken() async {
    String? token = await FirebaseMessaging.instance.getToken();

    log('TOKEN - $token');

    if (token == null) return;

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      log("NOVO TOKEN - $newToken");
    });
  }

  void _goToPageAfterMessage(RemoteMessage message) {
    log(
      'O CABEÇA CLICOU NA NOTIFICACAO: ${message.toMap()}',
    );

    final String link = message.data['link'] ?? '';

    log('LINK RECEBIDO: $link');

    if (link.isNotEmpty) {
      // Navigator.of(kNavigatorKey.currentContext!).pushNamed("");
    }
  }
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  log('BACKGROUND MESSAGE ALGUMA COISA: ${message.toMap()}');
}
