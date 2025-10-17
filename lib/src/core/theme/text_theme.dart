import 'package:flutter/material.dart';
import 'package:root/src/core/theme/colors.dart';

/// Centralized text theme definitions for the application
/// Provides consistent typography across light and dark modes
class AppTextTheme {
  AppTextTheme._();

  /// Light theme text styles
  static TextTheme lightTextTheme = const TextTheme(
    // Headlines
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.lightTextColor,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
      height: 1.3,
    ),
    
    // Titles
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.lightTextColor,
      height: 1.4,
    ),
    
    // Body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextColor,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextColor,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextSecondaryColor,
      height: 1.4,
    ),
    
    // Labels
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextColor,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextColor,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.lightTextSecondaryColor,
      height: 1.4,
    ),
  );

  /// Dark theme text styles
  static TextTheme darkTextTheme = const TextTheme(
    // Headlines
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
      height: 1.3,
    ),
    
    // Titles
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextColor,
      height: 1.4,
    ),
    
    // Body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextColor,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextColor,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextSecondaryColor,
      height: 1.4,
    ),
    
    // Labels
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextColor,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextColor,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextSecondaryColor,
      height: 1.4,
    ),
  );

  /// Custom text styles for specific use cases
  static TextStyle get button => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle get caption => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey.shade600,
  );

  static TextStyle get overline => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Colors.grey.shade600,
  );
}
