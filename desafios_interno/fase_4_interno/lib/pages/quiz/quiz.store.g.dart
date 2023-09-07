// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on QuizStoreBase, Store {
  late final _$currentQuestionAtom =
      Atom(name: 'QuizStoreBase.currentQuestion', context: context);

  @override
  int get currentQuestion {
    _$currentQuestionAtom.reportRead();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(int value) {
    _$currentQuestionAtom.reportWrite(value, super.currentQuestion, () {
      super.currentQuestion = value;
    });
  }

  late final _$finishedGameAtom =
      Atom(name: 'QuizStoreBase.finishedGame', context: context);

  @override
  bool get finishedGame {
    _$finishedGameAtom.reportRead();
    return super.finishedGame;
  }

  @override
  set finishedGame(bool value) {
    _$finishedGameAtom.reportWrite(value, super.finishedGame, () {
      super.finishedGame = value;
    });
  }

  late final _$showAnswerAtom =
      Atom(name: 'QuizStoreBase.showAnswer', context: context);

  @override
  bool get showAnswer {
    _$showAnswerAtom.reportRead();
    return super.showAnswer;
  }

  @override
  set showAnswer(bool value) {
    _$showAnswerAtom.reportWrite(value, super.showAnswer, () {
      super.showAnswer = value;
    });
  }

  late final _$QuizStoreBaseActionController =
      ActionController(name: 'QuizStoreBase', context: context);

  @override
  void init(Deck deck) {
    final _$actionInfo =
        _$QuizStoreBaseActionController.startAction(name: 'QuizStoreBase.init');
    try {
      return super.init(deck);
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowAnswer() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.toggleShowAnswer');
    try {
      return super.toggleShowAnswer();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextQuestion(bool isCorrect) {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.nextQuestion');
    try {
      return super.nextQuestion(isCorrect);
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentQuestion: ${currentQuestion},
finishedGame: ${finishedGame},
showAnswer: ${showAnswer}
    ''';
  }
}
