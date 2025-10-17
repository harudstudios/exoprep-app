import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Provides consistent route transitions throughout the application
/// This ensures a cohesive user experience across all navigation
class AppRouteTransition {
  AppRouteTransition._();

  /// Default page transition with slide and fade effect
  static CustomTransitionPage<T> defaultPageTransition<T>({
    required Widget child,
    required LocalKey key,
    Duration duration = const Duration(milliseconds: 400),
    Offset beginOffset = const Offset(0, 0.1),
    Curve curve = Curves.easeOutCubic,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: beginOffset, end: Offset.zero)
            .chain(CurveTween(curve: curve));
        final opacityTween = Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(opacityTween),
            child: child,
          ),
        );
      },
    );
  }

  /// Slide from right transition (typically for forward navigation)
  static CustomTransitionPage<T> slideFromRight<T>({
    required Widget child,
    required LocalKey key,
    Duration? duration,
  }) =>
      defaultPageTransition(
        beginOffset: const Offset(1, 0),
        duration: duration ?? const Duration(milliseconds: 350),
        child: child,
        key: key,
        curve: Curves.easeInOut,
      );

  /// Slide from bottom transition (typically for modals or settings)
  static CustomTransitionPage<T> slideFromBottom<T>({
    required Widget child,
    required LocalKey key,
    Duration? duration,
  }) =>
      defaultPageTransition(
        child: child,
        key: key,
        beginOffset: const Offset(0, 1),
        duration: duration ?? const Duration(milliseconds: 500),
      );

  /// Fade transition (for subtle navigation changes)
  static CustomTransitionPage<T> fadeTransition<T>({
    required Widget child,
    required LocalKey key,
    Duration? duration,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration ?? const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// Scale transition (for popup-like navigation)
  static CustomTransitionPage<T> scaleTransition<T>({
    required Widget child,
    required LocalKey key,
    Duration? duration,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration ?? const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.elasticOut),
          ),
          child: child,
        );
      },
    );
  }
}
