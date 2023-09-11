import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/theme.store.dart';

class ConfigPage extends StatelessWidget {
  final store = GetIt.I.get<ThemeStore>();
  ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferencias do usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Aparência"),
                SizedBox(
                  width: 150,
                  child: DropdownButton(
                    onChanged: (value) => store.changeThemeMode(value!),
                    value: store.themeMode.value,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text("Dia"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text("Noite"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text("Sistema"),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
