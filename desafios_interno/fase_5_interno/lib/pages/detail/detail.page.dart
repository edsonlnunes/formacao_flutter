import 'package:cached_network_image/cached_network_image.dart';
import 'package:fase_5_interno/models/character.model.dart';
import 'package:fase_5_interno/pages/detail/stores/detail.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailPage extends StatelessWidget {
  final Character character;
  final store = DetailStore();

  DetailPage({
    super.key,
    required this.character,
  }) {
    store.getDetailsData(character.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            collapsedHeight: 60,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: ValueKey(character.id),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Observer(
            builder: (ctx) {
              return store.isLoading
                  ? const SliverToBoxAdapter(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              child: Text(
                                '${character.name.toUpperCase()} | #${character.id}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              children: [
                                Chip(
                                  backgroundColor: character.color,
                                  label: Text(
                                    character.status,
                                    style: TextStyle(
                                      color: character.textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: character.color,
                                  label: Text(
                                    character.species,
                                    style: TextStyle(
                                      color: character.textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: character.color,
                                  label: Text(
                                    character.gender,
                                    style: TextStyle(
                                      color: character.textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Última localização conhecida: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              store.characterDetail!.location.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Local de origem: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              store.characterDetail!.origin.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Quantidades de vezes que apareceu: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${store.characterDetail!.numberEpisodes} episódios',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
