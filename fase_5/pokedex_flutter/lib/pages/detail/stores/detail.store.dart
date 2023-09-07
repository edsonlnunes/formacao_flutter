import 'package:mobx/mobx.dart';
import 'package:pokedex_flutter/services/poke_api.service.dart';

import '../../../models/pokemon_details.model.dart';

part 'detail.store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final _service = PokeApiService();

  @observable
  bool isLoading = false;

  @observable
  PokemonDetails? pokemonDetails;

  @action
  Future<void> getPokemonDetailsData(String nameOrId) async {
    isLoading = true;

    final pokemon = await _service.getPokemonDetail(nameOrId);

    pokemonDetails = pokemon;

    isLoading = false;
  }
}
