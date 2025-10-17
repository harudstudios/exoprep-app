import 'package:flutter/material.dart';
import 'package:root/src/core/app/app_scope.dart';
import 'package:root/src/core/common/listeners/auth_listener.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';
import 'package:root/src/repositories/authentication_repository.dart';
import 'package:root/src/repositories/user_repository.dart';
import 'package:root/src/services/firebase_auth_service.dart';

class AppDI extends StatelessWidget {
  final Widget child;

  const AppDI({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // Services
    final firebaseAuthService = FirebaseAuthService();

    // Repositories
    final authRepository = AuthenticationRepository(authService: firebaseAuthService);
    final userRepository = UserRepository();

    // ViewModels
    final authViewModel = AuthenticationViewModel(authRepository: authRepository, userRepository: userRepository);

    return AppScope(
      authViewModel: authViewModel,
      child: AuthListener(child: child),
    );
  }
}
