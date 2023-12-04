import 'package:mobx/mobx.dart';

import '../models/deck.model.dart';
import '../models/question.model.dart';

part 'deck.store.g.dart';

class DeckStore = DeckStoreBase with _$DeckStore;

abstract class DeckStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  Deck? deck;

  @computed
  Deck get safetyDeck {
    return deck!;
  }

  @computed
  List<Question> get questions {
    return safetyDeck.questions;
  }

  @action
  void init(Deck deck) {
    this.deck = deck;
  }

  @action
  void clear() {
    deck = null;
  }

  @action
  void addNewQuestion(Question question) {
    final tmpQuestions = List<Question>.from(deck!.questions);
    tmpQuestions.add(question);
    deck = deck!.copyWith(questions: tmpQuestions);
  }
}
