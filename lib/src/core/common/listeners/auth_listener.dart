import 'package:flutter/material.dart';
import 'package:root/src/core/extensions/app_scope_extension.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';

class AuthListener extends StatefulWidget {
  const AuthListener({required this.child, super.key});
  final Widget child;

  @override
  State<AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<AuthListener> {
  late AuthenticationViewModel authViewModel;
  // late ProfileViewModel profileViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authViewModel = context.authViewModel;
    // profileViewModel = context.profileViewModel;

    authViewModel.isAuthenticated.addListener(_onAuthStateChanged);
  }

  void _onAuthStateChanged() {
    if (authViewModel.isAuthenticated.value) {
      // profileViewModel.fetchUserProfile();
      // Call any function that is required in the home
    } else {
      // profileViewModel.resetProfileData();
    }
  }

  @override
  void dispose() {
    authViewModel.isAuthenticated.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
