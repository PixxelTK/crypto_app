import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary50 = Color(0xFFFFF1F2);
  static const Color primary100 = Color(0xFFFFE4E6);
  static const Color primary200 = Color(0xFFFECDD3);
  static const Color primary300 = Color(0xFFFDA4AF);
  static const Color primary400 = Color(0xFFFB7185);
  static const Color primary500 = Color(0xFFF43F5E);
  static const Color primary600 = Color(0xFFE11D48);
  static const Color primary700 = Color(0xFFBE123C);
  static const Color primary800 = Color(0xFF9F1239);
  static const Color primary900 = Color(0xFF881337);

  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF9FAFB);
  static const Color neutral100 = Color(0xFFF3F4F6);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);
  static const Color neutral700 = Color(0xFF374151);
  static const Color neutral800 = Color(0xFF1F2937);
  static const Color neutral900 = Color(0xFF111827);

  static const Color success50 = Color(0xFFF0FDF4);
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success500 = Color(0xFF22C55E);
  static const Color success600 = Color(0xFF16A34A);
  static const Color success700 = Color(0xFF15803D);

  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning700 = Color(0xFFB45309);

  static const Color danger50 = Color(0xFFFEF2F2);
  static const Color danger100 = Color(0xFFFEE2E2);
  static const Color danger500 = Color(0xFFEF4444);
  static const Color danger600 = Color(0xFFDC2626);
  static const Color danger700 = Color(0xFFB91C1C);

  static const Color info50 = Color(0xFFEFF6FF);
  static const Color info100 = Color(0xFFDBEAFE);
  static const Color info500 = Color(0xFF3B82F6);
  static const Color info600 = Color(0xFF2563EB);

  static const Color backgroundLight = neutral100;
  static const Color surfaceLight = neutral0;
}

class AppColorsTheme {
  final Color background;
  final Color surface;
  final Color surfaceSecondary;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;

  final Color border;
  final Color borderStrong;

  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;

  final Color success;
  final Color warning;
  final Color danger;
  final Color info;

  const AppColorsTheme({
    required this.background,
    required this.surface,
    required this.surfaceSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.border,
    required this.borderStrong,
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
  });

  static const AppColorsTheme light = AppColorsTheme(
    background: AppColors.neutral100,
    surface: AppColors.neutral0,
    surfaceSecondary: AppColors.neutral50,
    textPrimary: AppColors.neutral900,
    textSecondary: AppColors.neutral600,
    textTertiary: AppColors.neutral500,
    textDisabled: AppColors.neutral400,
    border: AppColors.neutral200,
    borderStrong: AppColors.neutral300,
    primary: AppColors.primary600,
    primaryHover: AppColors.primary700,
    primaryPressed: AppColors.primary800,
    success: AppColors.success600,
    warning: AppColors.warning600,
    danger: AppColors.danger600,
    info: AppColors.info600,
  );

  static const AppColorsTheme dark = AppColorsTheme(
    background: AppColors.neutral900,
    surface: AppColors.neutral800,
    surfaceSecondary: AppColors.neutral700,
    textPrimary: AppColors.neutral50,
    textSecondary: AppColors.neutral300,
    textTertiary: AppColors.neutral400,
    textDisabled: AppColors.neutral600,
    border: AppColors.neutral700,
    borderStrong: AppColors.neutral600,
    primary: AppColors.primary500,
    primaryHover: AppColors.primary400,
    primaryPressed: AppColors.primary300,
    success: AppColors.success500,
    warning: AppColors.warning500,
    danger: AppColors.danger500,
    info: AppColors.info500,
  );
}

extension AppColorsExt on BuildContext {
  AppColorsTheme get colors => Theme.of(this).brightness == Brightness.dark
      ? AppColorsTheme.dark
      : AppColorsTheme.light;
}
