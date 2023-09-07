import 'models/deck.model.dart';
import 'models/question.model.dart';
import 'repositories/deck.repository.dart';
import 'repositories/question.repository.dart';
import 'stores/deck.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/decks/decks.page.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(DeckAdapter());
  Hive.registerAdapter(QuestionAdapter());
}

void initServiceLocator() {
  GetIt.I.registerSingletonAsync(() async {
    final box = await Hive.openBox<Deck>("decks");
    return DeckRepository(box);
  });
  GetIt.I.registerSingletonAsync(() async {
    final box = await Hive.openBox<List>("questions");
    return QuestionRepository(box);
  });

  GetIt.I.registerSingleton(DeckStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card - Desafio Fase 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DecksPage(),
    );
  }
}
