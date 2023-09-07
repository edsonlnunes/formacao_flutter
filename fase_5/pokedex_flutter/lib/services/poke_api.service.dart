import 'dart:io';

import 'package:pokedex_flutter/models/poke_response.model.dart';
import 'package:pokedex_flutter/models/pokemon.model.dart';
import 'package:uno/uno.dart';

import '../models/pokemon_details.model.dart';

class PokeApiService {
  late final Uno _uno;

  PokeApiService() {
    _uno = Uno(baseURL: "https://pokeapi.co/api/v2");
  }

  Future<PokemonDetails> getPokemonDetail(String nameOrId) async {
    final response = await _uno.get("/pokemon/$nameOrId");

    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar o detalhe do pokemon");
    }

    return PokemonDetails.fromMap(response.data);
  }

  Future<PokeResponse> loadPokemons({required int offset}) async {
    final response = await _uno.get("/pokemon?offset=$offset&limit=20");

    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar os pokemons na API");
    }

    return PokeResponse.fromMap(response.data);
  }
}
