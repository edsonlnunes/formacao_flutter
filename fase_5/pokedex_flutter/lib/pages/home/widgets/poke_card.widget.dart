import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../colors.dart';
import '../../../models/pokemon.model.dart';
import '../stores/home.store.dart';

class PokeCard extends StatefulWidget {
  final Pokemon pokemon;
  final HomeStore store;

  const PokeCard({
    super.key,
    required this.pokemon,
    required this.store,
  });

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.pokemon.imageUrl));

    if (paletteGenerator.dominantColor != null && mounted) {
      widget.store.updatePokemonColor(
        pokemonId: widget.pokemon.id,
        color: paletteGenerator.dominantColor!.color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: widget.pokemon.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: ValueKey(widget.pokemon.id),
              child: CachedNetworkImage(
                imageUrl: widget.pokemon.imageUrl,
                height: 130,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.pokemon.name,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.pokemon.id.padLeft(4, '0'),
              style: const TextStyle(
                fontSize: 16,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
