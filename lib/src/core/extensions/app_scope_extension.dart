import 'package:flutter/material.dart';
import 'package:root/src/core/app/app_scope.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';

extension AppScopeExtension on BuildContext {
  AuthenticationViewModel get authViewModel => AppScope.of(this).authViewModel;
  // ProfileViewModel get profileViewModel => AppScope.of(this).profileViewModel;
// Add more accessors here when you add more viewmodels to the scope
}
