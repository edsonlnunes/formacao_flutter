import 'package:mobx/mobx.dart';

import '../../models/deck.model.dart';

part 'quiz.store.g.dart';

class QuizStore = QuizStoreBase with _$QuizStore;

abstract class QuizStoreBase with Store {
  @observable
  int currentQuestion = 0;

  @observable
  bool finishedGame = false;

  @observable
  bool showAnswer = false;

  int score = 0;

  late Deck deck;

  int get questionLenght {
    return deck.questions.length;
  }

  @action
  void init(Deck deck) {
    this.deck = deck;
  }

  @action
  void toggleShowAnswer() => showAnswer = !showAnswer;

  @action
  void nextQuestion(bool isCorrect) {
    if (isCorrect) score++;

    if ((currentQuestion + 1) == deck.questions.length) {
      finishedGame = true;
    } else {
      currentQuestion++;
    }

    showAnswer = false;
  }
}
