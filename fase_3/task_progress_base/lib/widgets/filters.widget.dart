import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text("Todos"),
          onSelected: (_) {},
          selectedColor: Colors.blue[100],
          selected: true,
        ),
        const SizedBox(
          width: 10,
        ),
        ChoiceChip(
          label: const Text("Completados"),
          onSelected: (_) {},
          selected: false,
        ),
        const SizedBox(
          width: 10,
        ),
        ChoiceChip(
          label: const Text("A fazer"),
          onSelected: (_) {},
          selected: false,
        ),
      ],
    );
  }
}
