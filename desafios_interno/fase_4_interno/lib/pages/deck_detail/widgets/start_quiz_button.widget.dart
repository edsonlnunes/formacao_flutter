import '../../../stores/deck.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../quiz/quiz.page.dart';

class StartQuizButton extends StatelessWidget {
  final deckStore = GetIt.I.get<DeckStore>();

  StartQuizButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: ElevatedButton(
        key: const Key("startQuizBtn"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          if (deckStore.questions.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => QuizPage(
                  deck: deckStore.safetyDeck,
                ),
              ),
            );
          }
        },
        child: const Text(
          "Iniciar Quiz",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
