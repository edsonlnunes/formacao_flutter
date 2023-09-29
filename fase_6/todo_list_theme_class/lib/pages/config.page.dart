import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/theme.store.dart';

class ConfigPage extends StatelessWidget {
  final _store = GetIt.I.get<ThemeStore>();
  ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações do usuário"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tema: "),
              SizedBox(
                width: 150,
                child: DropdownButton(
                  value: _store.themeMode.value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text("Claro"),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text("Escuro"),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text("Sistema"),
                    ),
                  ],
                  onChanged: (value) => _store.setThemeMode(value!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
