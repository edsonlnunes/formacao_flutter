import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../models/character.model.dart';
import '../stores/home.store.dart';

mixin LoadColor {
  Future<void> getPaletteColor({
    required HomeStore store,
    required Character character,
  }) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(character.image),
    );

    if (paletteGenerator.dominantColor != null) {
      store.updateCharacterColor(
        characterId: character.id,
        backgroundColor: paletteGenerator.dominantColor!.color,
        textColor: paletteGenerator.dominantColor!.bodyTextColor,
      );
    }
  }
}
