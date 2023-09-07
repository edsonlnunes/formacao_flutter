import 'package:flutter/material.dart';

class EmptyDecksPage extends StatelessWidget {
  final void Function() addDeck;

  const EmptyDecksPage({
    super.key,
    required this.addDeck,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/no_decks.png",
              height: 300,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: addDeck,
              child: const Text(
                "Adicionar deck",
              ),
            ),
          )
        ],
      ),
    );
  }
}
