import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? progressBackground;

  const AppColors({
    required this.primaryColor,
    required this.progressBackground,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? progressBackground,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      progressBackground: progressBackground ?? this.progressBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      progressBackground:
          Color.lerp(progressBackground, other.progressBackground, t),
    );
  }
}
