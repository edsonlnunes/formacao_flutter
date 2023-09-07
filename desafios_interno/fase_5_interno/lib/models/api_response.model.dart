import 'package:fase_5_interno/models/character.model.dart';

import 'api_info.model.dart';

class ApiResponse {
  final ApiInfo info;
  final List<Character> results;

  ApiResponse({
    required this.info,
    required this.results,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      info: ApiInfo.fromMap(map['info']),
      results: (map['results'] as List)
          .map<Character>((data) => Character.fromMap(data))
          .toList(),
    );
  }
}
