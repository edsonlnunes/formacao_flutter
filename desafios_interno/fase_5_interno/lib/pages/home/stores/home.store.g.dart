// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters => (_$filteredCharactersComputed ??=
          Computed<List<Character>>(() => super.filteredCharacters,
              name: 'HomeStoreBase.filteredCharacters'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'HomeStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$showInListAtom =
      Atom(name: 'HomeStoreBase.showInList', context: context);

  @override
  bool get showInList {
    _$showInListAtom.reportRead();
    return super.showInList;
  }

  @override
  set showInList(bool value) {
    _$showInListAtom.reportWrite(value, super.showInList, () {
      super.showInList = value;
    });
  }

  late final _$searchAtom =
      Atom(name: 'HomeStoreBase.search', context: context);

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('HomeStoreBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void toggleView() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.toggleView');
    try {
      return super.toggleView();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSerach(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSerach');
    try {
      return super.setSerach(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBackgroundColor(
      {required int characterId,
      required Color color,
      required Color textColor}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updateBackgroundColor');
    try {
      return super.updateBackgroundColor(
          characterId: characterId, color: color, textColor: textColor);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
characters: ${characters},
showInList: ${showInList},
search: ${search},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
