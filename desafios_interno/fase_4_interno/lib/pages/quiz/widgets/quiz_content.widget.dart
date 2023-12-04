import '../quiz.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'answer_question_button.widget.dart';

class QuizContent extends StatelessWidget {
  final QuizStore store;

  const QuizContent({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Observer(
            builder: (context) {
              return Text(
                "${store.currentQuestion + 1}/${store.questionLenght}",
                style: const TextStyle(
                  fontSize: 28,
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (context) {
                  return Text(
                    store.showAnswer
                        ? store.deck.questions[store.currentQuestion].answer
                        : store.deck.questions[store.currentQuestion].question,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                key: const Key("switchBetweenAnswerQuestionBtn"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: store.toggleShowAnswer,
                child: Observer(
                  builder: (context) {
                    return Text(
                      "Visualizar ${store.showAnswer ? 'pergunta' : 'resposta'}",
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              AnswerQuestionButton(
                key: const Key("correctAnswerBtn"),
                label: "Acertei :)",
                color: Colors.green,
                onPressed: () => store.nextQuestion(true),
              ),
              const SizedBox(
                height: 20,
              ),
              AnswerQuestionButton(
                key: const Key("wrongAnswerBtn"),
                label: "Errei :(",
                color: Colors.red,
                onPressed: () => store.nextQuestion(false),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
