import 'package:firebase_auth/firebase_auth.dart';
import 'package:root/src/core/exceptions/firebase_auth_exception.dart';
import 'package:root/src/services/firebase_auth_service.dart';

class AuthenticationRepository {
  final FirebaseAuthService _authService;

  AuthenticationRepository({FirebaseAuthService? authService}) : _authService = authService ?? FirebaseAuthService();

  Future<User?> login(String email, String password) async {
    try {
      final result = await _authService.signInWithEmail(email, password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromCode(e.code);
    }
  }

  Future<User?> signup(String email, String password) async {
    try {
      final result = await _authService.signUpWithEmail(email, password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromCode(e.code);
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
  }

  Future<User?> loginWithGoogle() async {
    try {
      final result = await _authService.signInWithGoogle();
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromCode(e.code);
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _authService.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure.fromCode(e.code);
    }
  }

  User? currentUser() => _authService.getCurrentUser();
}
