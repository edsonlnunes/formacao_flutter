import 'package:flutter/material.dart';

class EmptyShoppingList extends StatelessWidget {
  const EmptyShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/lista-de-compras.png",
          height: 120,
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
            "Crie sua primeira lista.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Center(
          child: Text(
            "Toque no botao azul",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
