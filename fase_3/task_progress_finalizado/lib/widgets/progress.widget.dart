import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/tasks.store.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<TasksStore>();

    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Progresso para finalizar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Observer(
            builder: (context) {
              return LinearProgressIndicator(
                value: store.progress,
                minHeight: 20,
              );
            },
          ),
        ],
      ),
    );
  }
}
