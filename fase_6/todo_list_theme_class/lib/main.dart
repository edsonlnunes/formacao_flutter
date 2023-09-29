import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/task.model.dart';
import 'pages/config.page.dart';
import 'pages/task_detail.page.dart';
import 'pages/tasks_list.page.dart';
import 'routes.dart';
import 'stores/theme.store.dart';
import 'themes/themes.dart';

void main() {
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());
  initializeDateFormatting("pt_BR", null).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GetIt.I.get<ThemeStore>().themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp(
          title: 'Todo list',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: MyRoutes.listTasks,
          routes: {
            MyRoutes.listTasks: (_) => const TasksListPage(),
            MyRoutes.taskDetail: (ctx) => TaskDetailPage(
                  task: ModalRoute.of(ctx)!.settings.arguments as Task,
                ),
            MyRoutes.configUser: (_) => ConfigPage()
          },
        );
      },
    );
  }
}
