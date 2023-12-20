import 'package:flutter/material.dart';

class SettinsPage extends StatelessWidget {
  const SettinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: const Center(
        child: Text("Página de configurações"),
      ),
    );
  }
}
