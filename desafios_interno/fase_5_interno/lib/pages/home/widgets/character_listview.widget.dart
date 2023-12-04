import 'package:fase_5_interno/pages/detail/detail.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/home.store.dart';
import 'character_list_card.widget.dart';

class CharacterListView extends StatelessWidget {
  final ScrollController scrollController;
  final HomeStore store;

  const CharacterListView({
    super.key,
    required this.scrollController,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          key: const Key("listView"),
          controller: scrollController,
          itemCount: store.filteredCharacters.length + 1,
          itemBuilder: (_, index) {
            if (index < store.filteredCharacters.length) {
              final character = store.filteredCharacters[index];
              return InkWell(
                key: const Key("listCard"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(character: character),
                    ),
                  );
                },
                child: CharacterListCard(
                  character: character,
                  store: store,
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
        );
      },
    );
  }
}
