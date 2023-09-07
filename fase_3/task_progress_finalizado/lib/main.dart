import 'package:flutter/material.dart';
import 'package:gerencia_estado/pages/home.page.dart';
import 'package:gerencia_estado/pages/other.page.dart';
import 'package:gerencia_estado/stores/tasks.store.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<TasksStore>(TasksStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de estado',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
    );
  }
}
