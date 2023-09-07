import 'package:flutter/material.dart';

import '../widgets/filters.widget.dart';
import '../widgets/progress.widget.dart';
import '../widgets/task_list.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Progress(),
            Filters(),
            Expanded(child: TaskList()),
          ],
        ),
      ),
    );
  }
}
