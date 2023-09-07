import 'add_question.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/deck.model.dart';
import '../../widgets/custom_input.widget.dart';

class AddQuestionPage extends StatefulWidget {
  final Deck deck;
  const AddQuestionPage({super.key, required this.deck});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final addQuestionStore = AddQuestionStore();

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  Future<void> addQuestion() async {
    if (questionController.text.isNotEmpty &&
        answerController.text.isNotEmpty) {
      final question = await addQuestionStore.addQuestion(
        question: questionController.text,
        answer: answerController.text,
        deckId: widget.deck.id,
      );
      if (!mounted) return;
      Navigator.of(context).pop(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Novo cartão"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInput(
              controller: questionController,
              label: "Pergunta",
            ),
            const SizedBox(
              height: 50,
            ),
            CustomInput(
              controller: answerController,
              label: "Resposta",
              maxLine: 3,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: addQuestion,
                child: Observer(
                  builder: (context) {
                    return addQuestionStore.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text(
                            "Adicionar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
