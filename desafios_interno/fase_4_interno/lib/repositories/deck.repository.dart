import 'package:hive/hive.dart';

import '../models/deck.model.dart';

class DeckRepository {
  final Box<Deck> _box;

  DeckRepository(this._box);

  // chave: deck:id
  Future<List<Deck>> getDecks() async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Deck>.from(_box.keys.map((key) => _box.get(key)));
  }

  Future<void> addDeck(Deck deck) async {
    await Future.delayed(const Duration(seconds: 1));
    await _box.put('deck:${deck.id}', deck);
  }

  Future<void> removeDeck(String deckId) async {
    await Future.delayed(const Duration(seconds: 1));
    await _box.delete('deck:$deckId');
  }
}
