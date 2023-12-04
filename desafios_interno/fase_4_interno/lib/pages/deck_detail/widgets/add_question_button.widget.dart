import '../../../models/question.model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/deck.store.dart';
import '../../add_question/add_question.page.dart';

class AddQuestionButton extends StatelessWidget {
  final deckStore = GetIt.I.get<DeckStore>();
  AddQuestionButton({
    super.key,
  });

  Future<void> addQuestion(BuildContext context) async {
    final question = await Navigator.of(context).push<Question>(
      MaterialPageRoute(
        builder: (ctx) => AddQuestionPage(deck: deckStore.safetyDeck),
      ),
    );

    if (question != null) {
      deckStore.addNewQuestion(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: OutlinedButton(
        key: const Key('addNewQuestionBtn'),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        onPressed: () => addQuestion(context),
        child: const Text(
          "Add Cartão",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
