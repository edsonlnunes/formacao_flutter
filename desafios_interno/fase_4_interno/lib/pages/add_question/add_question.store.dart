import '../../repositories/question.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/question.model.dart';

part 'add_question.store.g.dart';

class AddQuestionStore = AddQuestionStoreBase with _$AddQuestionStore;

abstract class AddQuestionStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  Future<Question> addQuestion({
    required String question,
    required String answer,
    required String deckId,
  }) async {
    isLoading = true;

    final repository = GetIt.I.get<QuestionRepository>();

    final question_ = Question(
      question: question,
      answer: answer,
      id: DateTime.now().millisecond.toString(),
    );

    await repository.addQuestion(question_, deckId);

    isLoading = false;
    return question_;
  }
}
