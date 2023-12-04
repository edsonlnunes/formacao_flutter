import 'dart:io';

import '../../models/deck.model.dart';
import '../../stores/deck.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'widgets/add_question_button.widget.dart';
import 'widgets/start_quiz_button.widget.dart';

class DeckDetailPage extends StatefulWidget {
  final Deck deck;

  const DeckDetailPage({super.key, required this.deck});

  @override
  State<DeckDetailPage> createState() => _DeckDetailPageState();
}

class _DeckDetailPageState extends State<DeckDetailPage> {
  final deckStore = GetIt.I.get<DeckStore>();

  @override
  void initState() {
    super.initState();
    deckStore.init(widget.deck);
  }

  @override
  void dispose() {
    deckStore.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deckStore.safetyDeck.name),
        backgroundColor: Colors.black,
        leading: BackButton(
          key: const Key("backToPreviousPageBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    deckStore.safetyDeck.name,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (context) {
                      return Text(
                        "${deckStore.questions.length} cartões",
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  AddQuestionButton(),
                  const SizedBox(height: 20),
                  StartQuizButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
