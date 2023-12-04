import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../models/character.model.dart';
import '../stores/home.store.dart';

class CharacterGridCard extends StatefulWidget {
  final Character character;
  final HomeStore store;

  const CharacterGridCard({
    super.key,
    required this.character,
    required this.store,
  });

  @override
  State<CharacterGridCard> createState() => _CharacterGridCardState();
}

class _CharacterGridCardState extends State<CharacterGridCard> {
  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.character.image),
    );

    if (paletteGenerator.dominantColor != null && mounted) {
      widget.store.updateBackgroundColor(
        characterId: widget.character.id,
        color: paletteGenerator.dominantColor!.color,
        textColor: paletteGenerator.dominantColor!.bodyTextColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: widget.character.color,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.character.id.toString(),
            style: TextStyle(
              fontSize: 16,
              color: widget.character.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Hero(
            tag: ValueKey(widget.character.id),
            child: CachedNetworkImage(
              imageUrl: widget.character.image,
              height: 130,
              key: const Key("imageGridCard"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.character.name,
            style: TextStyle(
              color: widget.character.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
