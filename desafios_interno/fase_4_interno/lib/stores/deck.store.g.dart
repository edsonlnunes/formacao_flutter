// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeckStore on DeckStoreBase, Store {
  Computed<Deck>? _$safetyDeckComputed;

  @override
  Deck get safetyDeck =>
      (_$safetyDeckComputed ??= Computed<Deck>(() => super.safetyDeck,
              name: 'DeckStoreBase.safetyDeck'))
          .value;
  Computed<List<Question>>? _$questionsComputed;

  @override
  List<Question> get questions =>
      (_$questionsComputed ??= Computed<List<Question>>(() => super.questions,
              name: 'DeckStoreBase.questions'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'DeckStoreBase.isLoading', context: context);

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

  late final _$deckAtom = Atom(name: 'DeckStoreBase.deck', context: context);

  @override
  Deck? get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(Deck? value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  late final _$DeckStoreBaseActionController =
      ActionController(name: 'DeckStoreBase', context: context);

  @override
  void init(Deck deck) {
    final _$actionInfo =
        _$DeckStoreBaseActionController.startAction(name: 'DeckStoreBase.init');
    try {
      return super.init(deck);
    } finally {
      _$DeckStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$DeckStoreBaseActionController.startAction(
        name: 'DeckStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$DeckStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewQuestion(Question question) {
    final _$actionInfo = _$DeckStoreBaseActionController.startAction(
        name: 'DeckStoreBase.addNewQuestion');
    try {
      return super.addNewQuestion(question);
    } finally {
      _$DeckStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
deck: ${deck},
safetyDeck: ${safetyDeck},
questions: ${questions}
    ''';
  }
}
