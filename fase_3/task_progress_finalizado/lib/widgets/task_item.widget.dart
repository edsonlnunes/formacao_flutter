import 'package:flutter/material.dart';
import 'package:gerencia_estado/stores/tasks.store.dart';
import 'package:get_it/get_it.dart';

import '../models/task.model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<TasksStore>();
    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.completed,
        onChanged: (_) => store.toggleCompletedTask(task.id),
      ),
    );
  }
}
