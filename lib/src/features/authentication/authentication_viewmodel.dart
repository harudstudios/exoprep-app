import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/constants/enums.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/repositories/authentication_repository.dart';
import 'package:root/src/repositories/user_repository.dart';

class AuthenticationViewModel {
  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;

  AuthenticationViewModel({
    AuthenticationRepository? authRepository,
    UserRepository? userRepository,
  }) : _authRepository = authRepository ?? AuthenticationRepository(),
       _userRepository = userRepository ?? UserRepository();

  final ValueNotifier<ViewModelState<String>> authState = ValueNotifier(
    ViewModelState.idle(data: ''),
  );
  final ValueNotifier<bool> isAuthenticated = ValueNotifier(false);

  Future<void> login({required String email, required String password}) async {
    authState.value = ViewModelState.loading(mode: AuthLoadingType.login.toString());
    try {
      final result = await _authRepository.login(email, password);
      AppLogs.info(result.toString());

      if (result != null) {
        // ✅ Fetch Firebase ID Token (Access Token)
        final user = FirebaseAuth.instance.currentUser;
        final idToken = await user?.getIdToken();
        log("Access Token: $idToken");

        authState.value = ViewModelState.success(
          data: result.toString(),
          type: AuthSuccessType.login.toString(),
        );
        isAuthenticated.value = true;
      } else {
        authState.value = ViewModelState.error(
          error: result.toString(),
          type: AuthErrorType.login.toString(),
        );
        isAuthenticated.value = false;
      }
    } catch (e) {
      AppLogs.warning("Error: $e");
      authState.value = ViewModelState.error(error: e.toString(), type: AuthErrorType.login.toString());
      isAuthenticated.value = false;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      authState.value = ViewModelState.loading(mode: AuthLoadingType.resetPassword.toString());
      await _authRepository.sendPasswordResetEmail(email: email);
      AppLogs.debug('Email send.');
      authState.value = ViewModelState.idle(data: AuthSuccessType.resetPassword.toString());
    } catch (e) {
      authState.value = ViewModelState.error(error: e.toString(), type: AuthErrorType.resetPassword.toString());
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    authState.value = ViewModelState.loading(mode: AuthLoadingType.signup.toString());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      final result = await _authRepository.signup(email, password);
      AppLogs.info('After SignUp: $result');
      if (result == null) {
        authState.value = ViewModelState.error(error: "Signup failed. Please try again.", type: AuthErrorType.signup.toString());
        isAuthenticated.value = false;
        return;
      }
      final data = {"name": name, "login_mode": "email"};
      await _userRepository.createUser(data: data);
      AppLogs.verbose('After Sign Up Success');
      authState.value = ViewModelState.success(data: result.toString(), type: AuthSuccessType.signup.toString());
      isAuthenticated.value = true;
    } catch (e) {
      log('Sign up Error: $e');
      authState.value = ViewModelState.error(error: e.toString(), type: AuthErrorType.signup.toString());
      isAuthenticated.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    authState.value = ViewModelState.loading(mode: AuthLoadingType.google.toString());
    try {
      final result = await _authRepository.loginWithGoogle();
      log('Token: ${await FirebaseAuth.instance.currentUser!.getIdToken()}');
      if (result == null) {
        authState.value = ViewModelState.error(error: "Google sign-in failed. Please try again.");
        isAuthenticated.value = false;
        return;
      }

      final data = {"name": FirebaseAuth.instance.currentUser?.displayName, "login_mode": "google"};
      final response = await _userRepository.createUser(data: data);
      AppLogs.verbose('After Sign Up Success');

      final newUser = (response.data?['new_user'] as bool?) ?? false;
      authState.value = ViewModelState.success(data: newUser, type: AuthSuccessType.google.toString());
      isAuthenticated.value = true;
    } catch (e) {
      AppLogs.error('Google Login Error: $e');
      authState.value = ViewModelState.error(error: e.toString(), type: AuthErrorType.google.toString());
      isAuthenticated.value = false;
    }
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> logout() async {
    await _authRepository.logout();
    isAuthenticated.value = false;
  }

  User? getCurrentUserSync() {
    return FirebaseAuth.instance.currentUser;
  }

  void dispose() {
    authState.dispose();
  }
}
