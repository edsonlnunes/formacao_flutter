import 'package:fase_5/models/api_response.model.dart';
import 'package:uno/uno.dart';

import '../models/character_detail.model.dart';

class ApiService {
  late final Uno _uno;

  ApiService() {
    _uno = Uno(baseURL: "https://rickandmortyapi.com/api");
  }

  Future<ApiResponse> getListCharacters({required int page}) async {
    final response = await _uno.get("/character?page=$page");

    if (response.status != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return ApiResponse.fromMap(response.data);
  }

  Future<CharacterDetail> getCharacterDetail({required int characterId}) async {
    final response = await _uno.get("/character/$characterId");

    if (response.status != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return CharacterDetail.fromMap(response.data);
  }
}
