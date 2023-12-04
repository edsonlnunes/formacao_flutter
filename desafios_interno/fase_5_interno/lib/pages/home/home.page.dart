import 'package:cached_network_image/cached_network_image.dart';
import 'package:fase_5_interno/pages/home/widgets/character_gridview.widget.dart';
import 'package:fase_5_interno/pages/home/widgets/character_listview.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'stores/home.store.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    store.loadData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      store.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rick and Morty",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Procupero pelo seu personagem",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                key: const Key("filterInput"),
                decoration: InputDecoration(
                  hintText: "Nome ou identificador",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                onChanged: store.setSerach,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: store.toggleView,
                  icon: Observer(
                    builder: (context) {
                      return Icon(
                        store.showInList ? Icons.grid_view : Icons.list,
                        color: Colors.white,
                        size: 30,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    return store.showInList
                        ? CharacterListView(
                            store: store,
                            scrollController: scrollController,
                          )
                        : CharacterGridView(
                            store: store,
                            scrollController: scrollController,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
