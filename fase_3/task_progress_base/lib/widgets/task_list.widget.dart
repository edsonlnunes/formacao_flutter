import 'package:flutter/material.dart';

import 'task_item.widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TaskItem(title: "Instalar o flutter"),
        TaskItem(title: "Instalar o Android Studio"),
        TaskItem(title: "Adicionar as extensões no Android Studio"),
        TaskItem(title: "Instalar o VS Code"),
        TaskItem(title: "Adicionar as extensões no VS Code"),
        TaskItem(title: "Aceitar as licenças do Android"),
        TaskItem(title: "Rodar flutter doctor"),
        TaskItem(title: "Criar projeto flutter"),
        TaskItem(title: "Abrir emulador android/ios"),
        TaskItem(title: "Rodar projeto"),
      ],
    );
  }
}
