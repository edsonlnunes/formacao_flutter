import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../models/character.model.dart';
import '../stores/home.store.dart';

class CharacterListCard extends StatefulWidget {
  final Character character;
  final HomeStore store;

  const CharacterListCard({
    super.key,
    required this.character,
    required this.store,
  });

  @override
  State<CharacterListCard> createState() => _CharacterListCardState();
}

class _CharacterListCardState extends State<CharacterListCard> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Hero(
              tag: ValueKey(widget.character.id),
              child: CachedNetworkImage(
                imageUrl: widget.character.image,
                key: const Key("imageListCard"),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.character.name,
                  style: TextStyle(
                    color: widget.character.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: widget.character.status == "Alive"
                          ? Colors.green
                          : Colors.red,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        '${widget.character.status} - ${widget.character.species}',
                        style: TextStyle(
                          color: widget.character.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.character.gender,
                  style: TextStyle(
                    color: widget.character.textColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${widget.character.id}',
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.character.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
