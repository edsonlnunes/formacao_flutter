import 'package:hive/hive.dart';

import '../models/question.model.dart';

class QuestionRepository {
  final Box<List> _box;

  QuestionRepository(this._box);

  Future<List<Question>> getQuestions(String deckId) async {
    await Future.delayed(const Duration(seconds: 1));

    final questions = List<Question>.from(_box.get(
      'question:$deckId',
      defaultValue: [],
    )!);

    return questions;
  }

  Future<void> addQuestion(Question question, String deckId) async {
    final questions = await getQuestions(deckId);
    questions.add(question);
    await _box.put('question:$deckId', questions);
  }

  Future<void> removeQuestion(String questionId, String deckId) async {
    final questions = await getQuestions(deckId);
    questions.removeWhere((q) => q.id == questionId);
    await _box.put('question:$deckId', questions);
  }
}
