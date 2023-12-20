import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_test/pages/splash_screen.page.dart';
import 'package:login_test/widgets/my_drawer/my_drawer.store.dart';

import 'firebase_options.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.I.registerSingleton(MyDrawerStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Login',
      debugShowCheckedModeBanner: false,
      navigatorKey: kNavigatorKey,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFf9f4ec),
        ),
        listTileTheme: const ListTileThemeData(
          selectedColor: Colors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFf9f4ec),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
      home: const SplashScreenPage(),
    );
  }
}
