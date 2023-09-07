import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_flutter/models/pokemon.model.dart';
import 'package:pokedex_flutter/services/poke_api.service.dart';

// Include generated file
part 'home.store.g.dart';

// This is the class used by rest of your codebase
class HomeStore = HomeStoreBase with _$HomeStore;

// The store-class
abstract class HomeStoreBase with Store {
  final _service = PokeApiService();

  int offset = 0;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Pokemon> pokemons = <Pokemon>[].asObservable();

  @observable
  String? search;

  @computed
  List<Pokemon> get filteredPokes {
    if (search == null) return pokemons.toList();

    return pokemons
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(search!.toLowerCase()) ||
            pokemon.id == search)
        .toList();
  }

  @action
  void setSerach(String? text) => search = text;

  @action
  Future<void> loadPokemons() async {
    isLoading = true;

    final pokeResponse = await _service.loadPokemons(offset: offset);

    offset += 20;
    pokemons.addAll(pokeResponse.results);

    isLoading = false;
  }

  @action
  void updatePokemonColor({required String pokemonId, required Color color}) {
    final indexPokemon =
        pokemons.indexWhere((pokemon) => pokemon.id == pokemonId);
    pokemons[indexPokemon] = pokemons[indexPokemon].copyWith(color: color);
  }
}
