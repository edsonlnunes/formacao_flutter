import 'package:flutter/material.dart';

class ThemeStore {
  final themeMode = ValueNotifier(ThemeMode.system);

  setThemeMode(ThemeMode mode) => themeMode.value = mode;
}
