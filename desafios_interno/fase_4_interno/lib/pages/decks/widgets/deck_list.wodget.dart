import '../decks.store.dart';
import 'package:flutter/material.dart';

import '../../../models/deck.model.dart';
import '../../../models/question.model.dart';
import '../../deck_detail/deck_detail.page.dart';

class DeckListPage extends StatelessWidget {
  const DeckListPage({
    super.key,
    required this.store,
  });

  final DecksStore store;

  Future<void> navigateToDeckDetail(BuildContext context, Deck deck) async {
    final questions = await Navigator.of(context).push<List<Question>>(
      MaterialPageRoute(
        builder: (ctx) => DeckDetailPage(deck: deck),
      ),
    );

    if (questions != null && questions.length != deck.questions.length) {
      store.loadDecks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.decks.length,
      itemBuilder: (ctx, index) {
        final deck = store.decks[index];
        return InkWell(
          key: const Key("deckCard"),
          onTap: () => navigateToDeckDetail(context, deck),
          onLongPress: () => store.removeDeck(deck.id),
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    deck.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${deck.questions.length} ${deck.questions.length == 1 ? 'cartão' : 'cartões'}",
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
