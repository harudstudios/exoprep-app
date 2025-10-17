import 'package:flutter/material.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';

class AppScope extends InheritedWidget {
  final AuthenticationViewModel authViewModel;

  // Add more view models and services here as needed

  const AppScope({
    required super.child,
    required this.authViewModel,
    super.key,
  });

  static AppScope of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(result != null, 'DependencyScope not found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppScope oldWidget) {
    // Only notify if any of the viewmodels and services change
    return authViewModel != oldWidget.authViewModel;
    /*
    return profileViewModel != oldWidget.profileViewModel 
    || otherViewModel != oldWidget.otherViewModel;
    */
  }
}
