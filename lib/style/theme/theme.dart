import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final colors = AppColorsTheme.light;
    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        onPrimary: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        error: colors.danger,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: colors.background,
      fontFamily: AppTypography.fontFamily,
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        headlineLarge: AppTypography.headingLarge,
        headlineMedium: AppTypography.headingMedium,
        headlineSmall: AppTypography.headingSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
    );
  }

  static ThemeData dark() {
    final colors = AppColorsTheme.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      splashFactory: NoSplash.splashFactory,
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        onPrimary: Colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
        error: colors.danger,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: colors.background,
      fontFamily: AppTypography.fontFamily,
      textTheme: const TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        headlineLarge: AppTypography.headingLarge,
        headlineMedium: AppTypography.headingMedium,
        headlineSmall: AppTypography.headingSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
    );
  }
}
