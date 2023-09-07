import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minha_biblioteca/models/category.model.dart';
import 'package:minha_biblioteca/models/content.model.dart';
import 'package:minha_biblioteca/repositories/category.repository.dart';
import 'package:minha_biblioteca/repositories/content.repository.dart';
import 'pages/home/home.page.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ContentAdapter());
}

void initServiceLocator() {
  GetIt.I.registerSingletonAsync(() async {
    final box = await Hive.openBox<List>("categories");
    return CategoryRepository(boxCategories: box);
  });

  GetIt.I.registerSingletonAsync(() async {
    final box = await Hive.openBox<List>("contents");
    return ContentRepository(boxContents: box);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Biblioteca',
      home: HomePage(),
    );
  }
}
