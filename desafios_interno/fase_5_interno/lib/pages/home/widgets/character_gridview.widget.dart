import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../detail/detail.page.dart';
import '../stores/home.store.dart';
import 'character_grid_card.widget.dart';

class CharacterGridView extends StatelessWidget {
  final ScrollController scrollController;
  final HomeStore store;

  const CharacterGridView({
    super.key,
    required this.scrollController,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GridView.builder(
          key: const Key("gridView"),
          controller: scrollController,
          itemCount: store.filteredCharacters.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (ctx, index) {
            if (index < store.filteredCharacters.length) {
              final character = store.filteredCharacters[index];
              return InkWell(
                key: const Key("gridCard"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(character: character),
                    ),
                  );
                },
                child: CharacterGridCard(
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
