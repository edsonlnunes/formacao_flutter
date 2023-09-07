import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../models/category.model.dart';
import 'widgets/card_category/card_category.widget.dart';
import 'widgets/new_category/new_category.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void newCategory(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (ctx) {
        return const NewCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Bem-vindo a sua biblioteca"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Escolha uma das categorias",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: [
                  CardCategory(
                    category: Category(id: "1", name: "Filmes"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => newCategory(context),
        backgroundColor: primaryColor.withOpacity(.8),
        label: const Text("+ Categoria"),
      ),
    );
  }
}
