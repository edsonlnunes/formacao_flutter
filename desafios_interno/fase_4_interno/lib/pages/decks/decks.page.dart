import 'decks.store.dart';
import '../new_deck/new_deck.page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/deck_list.wodget.dart';
import 'widgets/empty_decks.widget.dart';

class DecksPage extends StatelessWidget {
  final DecksStore decksStore = DecksStore();
  DecksPage({super.key}) {
    GetIt.I.allReady().then((_) {
      decksStore.init(
        deckRepository: GetIt.I.get(),
        questionRepository: GetIt.I.get(),
      );
      decksStore.loadDecks();
    });
  }

  Future<void> addDeck(BuildContext context) async {
    final deckName = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (ctx) => const NewDeckPage(),
      ),
    );

    if (deckName != null) {
      decksStore.addDeck(deckName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decks"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () => addDeck(context),
        label: const Text("Adicionar"),
      ),
      body: Observer(
        builder: (ctx) {
          if (decksStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }

          return decksStore.decks.isEmpty
              ? EmptyDecksPage(addDeck: () => addDeck(context))
              : DeckListPage(store: decksStore);
        },
      ),
    );
  }
}
