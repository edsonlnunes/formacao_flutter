import '../../repositories/deck.repository.dart';
import '../../repositories/question.repository.dart';
import 'package:mobx/mobx.dart';

import '../../models/deck.model.dart';

part 'decks.store.g.dart';

class DecksStore = DecksStoreBase with _$DecksStore;

abstract class DecksStoreBase with Store {
  late final DeckRepository _deckRepository;
  late final QuestionRepository _questionRepository;

  @observable
  ObservableList<Deck> decks = <Deck>[].asObservable();

  @observable
  bool isLoading = false;

  void init({
    required DeckRepository deckRepository,
    required QuestionRepository questionRepository,
  }) {
    _deckRepository = deckRepository;
    _questionRepository = questionRepository;
  }

  @action
  Future<void> loadDecks() async {
    isLoading = true;
    // final allDecks =
    //     await Future.wait((await _deckRepository.getDecks()).map((deck) async {
    //   final questions = await _questionRepository.getQuestions(deck.id);
    //   return deck.copyWith(questions: questions);
    // }).toList());

    final allDecks = await _deckRepository.getDecks();

    for (var i = 0; i < allDecks.length; i++) {
      final deck = allDecks[i];
      final questions = await _questionRepository.getQuestions(deck.id);
      allDecks[i] = deck.copyWith(questions: questions);
    }

    decks = allDecks.asObservable();
    isLoading = false;
  }

  @action
  Future<void> addDeck(String name) async {
    isLoading = true;
    final deck = Deck(
      name: name,
      id: DateTime.now().millisecond.toString(),
    );
    await _deckRepository.addDeck(deck);
    decks.add(deck);
    isLoading = false;
  }

  @action
  Future<void> removeDeck(String deckId) async {
    isLoading = true;
    await _deckRepository.removeDeck(deckId);
    decks.removeWhere((deck) => deck.id == deckId);
    isLoading = false;
  }
}
