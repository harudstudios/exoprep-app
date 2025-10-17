import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleSignInAccount? _signedInAccount;

  FirebaseAuthService() {
    _init();
  }

  Future<void> _init() async {
    await _googleSignIn.initialize();

    // Listen to sign-in / sign-out events
    _googleSignIn.authenticationEvents.listen((event) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        _signedInAccount = event.user;
      } else if (event is GoogleSignInAuthenticationEventSignOut) {
        _signedInAccount = null;
      }
    });
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    _signedInAccount = null;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Start authentication flow
      final account = await _googleSignIn.authenticate();
      _signedInAccount = account;

      // Get ID token (for Firebase)
      final auth = account.authentication;
      final idToken = auth.idToken;

      if (idToken == null) {
        throw FirebaseAuthException(
          code: 'MISSING_ID_TOKEN',
          message: 'Google Sign-In did not return an idToken.',
        );
      }

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      return await _firebaseAuth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      throw FirebaseAuthException(code: e.code.name, message: e.description);
    }
  }

  Future<String?> getAccessTokenForScopes(List<String> scopes) async {
    final account = _signedInAccount;
    if (account == null) return null;

    final authClient = account.authorizationClient;

    // Try to reuse existing authorization
    var authorization = await authClient.authorizationForScopes(scopes);

    // If not authorized, request user approval
    authorization ??= await authClient.authorizeScopes(scopes);

    return authorization.accessToken;
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  User? getCurrentUser() => _firebaseAuth.currentUser;
}
