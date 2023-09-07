import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gerencia_estado/stores/tasks.store.dart';
import 'package:get_it/get_it.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<TasksStore>();

    return Observer(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text("Todos"),
              onSelected: (_) => store.setNumberChip(1),
              selectedColor: Colors.blue[100],
              selected: store.numberChipSelected == 1,
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("Completados"),
              onSelected: (_) => store.setNumberChip(2),
              selected: store.numberChipSelected == 2,
              selectedColor: Colors.blue[100],
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceChip(
              label: const Text("A fazer"),
              onSelected: (_) => store.setNumberChip(3),
              selected: store.numberChipSelected == 3,
              selectedColor: Colors.blue[100],
            ),
          ],
        );
      },
    );
  }
}
