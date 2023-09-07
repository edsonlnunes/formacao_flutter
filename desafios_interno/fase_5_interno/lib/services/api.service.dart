import 'dart:io';

import 'package:fase_5_interno/models/api_response.model.dart';
import 'package:fase_5_interno/models/character.model.dart';
import 'package:fase_5_interno/models/character_detail.model.dart';
import 'package:uno/uno.dart';

class ApiService {
  late final Uno _uno;

  ApiService() {
    _uno = Uno(baseURL: "https://rickandmortyapi.com/api");
  }

  Future<CharacterDetail> getCharacterDetail(int id) async {
    final response = await _uno.get("/character/$id");

    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar o detalhe do personagem");
    }

    return CharacterDetail.fromMap(response.data);
  }

  Future<ApiResponse> loadCharacters({required int page}) async {
    final response = await _uno.get("/character?page=$page");

    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar os personagens na API");
    }

    return ApiResponse.fromMap(response.data);
  }
}
