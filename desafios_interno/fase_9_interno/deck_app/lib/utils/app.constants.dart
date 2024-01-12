import 'package:dio/dio.dart';

abstract class AppConstants {
  static const String baseUrl =
      'https://3a25-2804-4508-5115-fd41-fc9e-4f93-55a8-e4e4.ngrok-free.app/api';
  static String? token;
  static Map<String, String> get headerApi => {
        'authorization': 'Bearer $token',
      };
  static final dioOptions = Options(headers: AppConstants.headerApi);
}
