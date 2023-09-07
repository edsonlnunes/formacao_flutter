import 'quiz.store.dart';
import 'widgets/result_quiz.widget.dart';
import 'widgets/quiz_content.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/deck.model.dart';

class QuizPage extends StatefulWidget {
  final Deck deck;
  const QuizPage({super.key, required this.deck});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final store = QuizStore();

  @override
  void initState() {
    super.initState();
    store.init(widget.deck);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz: ${store.deck.name}"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(
          builder: (context) {
            return !store.finishedGame
                ? QuizContent(
                    store: store,
                  )
                : ResultQuiz(score: store.score);
          },
        ),
      ),
    );
  }
}
