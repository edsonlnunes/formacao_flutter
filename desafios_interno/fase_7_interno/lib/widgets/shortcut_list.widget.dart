import 'package:flutter/material.dart';

import 'shortcut_chip.widget.dart';

class ShortcutList extends StatelessWidget {
  const ShortcutList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (_, __) => const ShortcutChip(),
      ),
    );
  }
}
