import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../stores/tasks.store.dart';
import '../widgets/filters.widget.dart';
import '../widgets/progress.widget.dart';
import '../widgets/task_list.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<TasksStore>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Progress(),
            const Filters(),
            Expanded(
              child: Observer(
                builder: (context) {
                  return TaskList(tasks: store.filteredTasks);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
