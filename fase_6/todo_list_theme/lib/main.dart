import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/pages/task_detail.page.dart';
import 'package:todo_list/pages/tasks_list.page.dart';
import 'package:todo_list/routes.dart';
import 'package:todo_list/stores/theme.store.dart';
import 'package:todo_list/themes/theme.dart';

import 'models/task.model.dart';
import 'pages/config.page.dart';

void main() {
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());

  initializeDateFormatting("pt_BR", null).then(
    (value) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  final store = GetIt.I.get<ThemeStore>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store.themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp(
          title: 'Todo list',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: Routes.tasksList,
          routes: {
            Routes.tasksList: (_) => const TasksListPage(),
            Routes.taskDetail: (ctx) => TaskDetailPage(
                  task: ModalRoute.of(ctx)!.settings.arguments as Task,
                ),
            Routes.configUser: (_) => ConfigPage(),
          },
        );
      },
    );
  }
}
