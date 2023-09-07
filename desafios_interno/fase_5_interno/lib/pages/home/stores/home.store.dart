import 'package:fase_5_interno/models/character.model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../services/api.service.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _service = ApiService();

  int page = 1;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Character> characters = <Character>[].asObservable();

  @observable
  bool showInList = true;

  @observable
  String? search;

  @action
  void toggleView() => showInList = !showInList;

  @computed
  List<Character> get filteredCharacters {
    if (search == null) return characters.toList();

    return characters
        .where((character) =>
            character.name.toLowerCase().contains(search!.toLowerCase()) ||
            character.id.toString() == search)
        .toList();
  }

  @action
  void setSerach(String? text) => search = text;

  @action
  Future<void> loadData() async {
    isLoading = true;

    final apiResponse = await _service.loadCharacters(page: page);

    page++;
    characters.addAll(apiResponse.results);

    isLoading = false;
  }

  @action
  void updateBackgroundColor({
    required int characterId,
    required Color color,
    required Color textColor,
  }) {
    final indexCharacter = characters.indexWhere(
      (character) => character.id == characterId,
    );

    characters[indexCharacter] = characters[indexCharacter].copyWith(
      color: color,
      textColor: textColor,
    );
  }
}
