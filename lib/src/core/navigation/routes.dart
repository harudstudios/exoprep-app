import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Enum defining all application routes
/// This centralizes route management and makes navigation type-safe
enum AppRoute {
  // Core routes
  splash('/'),
  authentication('/authentication'),
  home('/home'),
  selectExams('/selectExams'),
  profile('/profile'),
  settings('/profile/settings'),
  
  // Feature routes (add your feature routes here)
  // Example: dashboard('/dashboard'),
  // Example: notifications('/notifications'),
  ;

  const AppRoute(this.path);
  final String path;
}

/// Extension to provide convenient navigation methods
extension AppRouteNavigation on AppRoute {
  /// Navigate to this route, replacing current route
  void go(BuildContext context, {Object? extra}) => context.go(path, extra: extra);
  
  /// Push this route onto the navigation stack
  void push(BuildContext context, {Object? extra}) => context.push(path, extra: extra);
  
  /// Push this route and remove all routes behind it
  void pushAndClearStack(BuildContext context, {Object? extra}) => 
      context.pushReplacement(path, extra: extra);
}
