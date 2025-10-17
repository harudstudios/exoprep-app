import 'package:flutter/material.dart';

/// Centralized color definitions for the application
/// Provides consistent theming across light and dark modes
class AppColors {
  AppColors._();

  /*---------------- Brand Colors ----------------*/
  static const Color primaryColor = Color(0xFF006FFD);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color accentColor = Color(0xFFFF6B35);

  /*---------------- System Colors ----------------*/
  static const Color errorColor = Color(0xFFB00020);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color infoColor = Color(0xFF2196F3);

  /*---------------- Light Theme Colors ----------------*/
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightSurfaceColor = Color(0xFFF8F9FA);
  static const Color lightTextColor = Color(0xFF212121);
  static const Color lightTextSecondaryColor = Color(0xFF757575);
  static const Color lightBorderColor = Color(0xFFE0E0E0);

  /*---------------- Dark Theme Colors ----------------*/
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color darkTextColor = Color(0xFFE0E0E0);
  static const Color darkTextSecondaryColor = Color(0xFFB0B0B0);
  static const Color darkBorderColor = Color(0xFF2C2C2C);

  /*---------------- Gradient Colors ----------------*/
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xFF0056CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryColor, Color(0xFF018786)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /*---------------- Status Colors ----------------*/
  static const Color onlineColor = Color(0xFF4CAF50);
  static const Color offlineColor = Color(0xFF9E9E9E);
  static const Color awayColor = Color(0xFFFF9800);

  /*---------------- Overlay Colors ----------------*/
  static Color overlayLight = Colors.black.withValues(alpha: 0.6);
  static Color overlayDark = Colors.black.withValues(alpha: 0.8);
}
