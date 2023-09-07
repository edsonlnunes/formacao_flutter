import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  const TaskItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: const Checkbox(
        value: false,
        onChanged: null,
      ),
    );
  }
}
