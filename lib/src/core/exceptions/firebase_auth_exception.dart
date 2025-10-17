class FirebaseAuthFailure implements Exception {
  final String message;

  FirebaseAuthFailure(this.message);

  factory FirebaseAuthFailure.fromCode(String code) {
    switch (code.trim().toLowerCase()) {
    // ----- Email & Password Errors -----
      case 'invalid-email':
        return FirebaseAuthFailure('The email address is badly formatted.');
      case 'email-already-in-use':
        return FirebaseAuthFailure('The email address is already in use by another account.');
      case 'user-not-found':
        return FirebaseAuthFailure('No user found for the provided email.');
      case 'wrong-password':
        return FirebaseAuthFailure('The password is invalid or the user does not have a password.');
      case 'weak-password':
        return FirebaseAuthFailure('The password is too weak. Please choose a stronger one.');
      case 'missing-password':
        return FirebaseAuthFailure('Please enter your password.');
      case 'missing-email':
        return FirebaseAuthFailure('Please enter your email address.');

    // ----- User Account Status -----
      case 'user-disabled':
        return FirebaseAuthFailure('This user account has been disabled.');
      case 'user-token-expired':
        return FirebaseAuthFailure('Your session has expired. Please sign in again.');
      case 'invalid-user-token':
        return FirebaseAuthFailure('Invalid user token. Please sign in again.');
      case 'user-mismatch':
        return FirebaseAuthFailure('The provided credentials do not match the previously signed in user.');

    // ----- Credential & Auth Provider Errors -----
      case 'invalid-credential':
        return FirebaseAuthFailure('Your credentials are invalid. Please try again.');
      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure('An account already exists with the same email address but different sign-in credentials.');
      case 'credential-already-in-use':
        return FirebaseAuthFailure('This credential is already associated with another user account.');
      case 'invalid-verification-code':
        return FirebaseAuthFailure('The verification code is invalid. Please try again.');
      case 'invalid-verification-id':
        return FirebaseAuthFailure('The verification ID is invalid. Please request a new code.');
      case 'invalid-credential-type':
        return FirebaseAuthFailure('This credential type is not supported for this operation.');
      case 'invalid-continue-uri':
        return FirebaseAuthFailure('The continue URL provided is invalid.');
      case 'missing-continue-uri':
        return FirebaseAuthFailure('A continue URL must be provided.');

    // ----- Action Code & Link Errors -----
      case 'expired-action-code':
        return FirebaseAuthFailure('The action code has expired.');
      case 'invalid-action-code':
        return FirebaseAuthFailure('The action code is invalid.');
      case 'invalid-oob-code':
        return FirebaseAuthFailure('The out-of-band code is invalid or has expired.');
      case 'missing-oob-code':
        return FirebaseAuthFailure('The action code is missing.');

    // ----- Phone Auth Errors -----
      case 'captcha-check-failed':
        return FirebaseAuthFailure('Captcha verification failed. Please try again.');
      case 'invalid-phone-number':
        return FirebaseAuthFailure('The provided phone number is not valid.');
      case 'missing-phone-number':
        return FirebaseAuthFailure('Please provide a valid phone number.');
      case 'quota-exceeded':
        return FirebaseAuthFailure('SMS quota for this project has been exceeded. Please try again later.');
      case 'missing-verification-code':
        return FirebaseAuthFailure('The verification code is missing.');
      case 'session-expired':
        return FirebaseAuthFailure('The SMS code has expired. Please request a new one.');
      case 'app-not-authorized':
        return FirebaseAuthFailure('This app is not authorized to use Firebase Authentication.');
      case 'app-not-verified':
        return FirebaseAuthFailure('The app verification failed. Please try again.');
      case 'invalid-session-info':
        return FirebaseAuthFailure('The session information is invalid or expired.');

    // ----- Popup / Redirect / Web Flow Errors -----
      case 'popup-closed-by-user':
        return FirebaseAuthFailure('The popup was closed before completing the sign in.');
      case 'popup-blocked':
        return FirebaseAuthFailure('The popup was blocked by the browser.');
      case 'unauthorized-domain':
        return FirebaseAuthFailure('This domain is not authorized for OAuth operations.');

    // ----- API / Network / Internal Errors -----
      case 'network-request-failed':
        return FirebaseAuthFailure('A network error occurred. Please check your connection.');
      case 'too-many-requests':
        return FirebaseAuthFailure('Too many requests. Please try again later.');
      case 'internal-error':
        return FirebaseAuthFailure('An internal error occurred. Please try again later.');
      case 'operation-not-allowed':
        return FirebaseAuthFailure('This operation is not allowed. Please enable it in the Firebase console.');
      case 'timeout':
        return FirebaseAuthFailure('The request timed out. Please try again.');
      case 'app-deleted':
        return FirebaseAuthFailure('This Firebase app instance has been deleted.');
      case 'invalid-api-key':
        return FirebaseAuthFailure('Your API key is invalid. Please check your Firebase configuration.');

    // ----- Token / Permission Errors -----
      case 'invalid-custom-token':
        return FirebaseAuthFailure('The custom token format is incorrect.');
      case 'custom-token-mismatch':
        return FirebaseAuthFailure('The custom token corresponds to a different audience.');
      case 'invalid-id-token':
        return FirebaseAuthFailure('The user’s credential is no longer valid. Please sign in again.');
      case 'id-token-expired':
        return FirebaseAuthFailure('The user’s credential has expired. Please sign in again.');
      case 'unauthorized-continue-uri':
        return FirebaseAuthFailure('The domain of the continue URL is not whitelisted.');
      case 'rejected-credential':
        return FirebaseAuthFailure('The credential was rejected by the server.');
      case 'requires-recent-login':
        return FirebaseAuthFailure('Please reauthenticate to perform this action.');

    // ----- Multi-Factor Authentication -----
      case 'missing-multi-factor-info':
        return FirebaseAuthFailure('Multi-factor information is missing.');
      case 'missing-multi-factor-session':
        return FirebaseAuthFailure('Multi-factor session is missing.');
      case 'invalid-multi-factor-session':
        return FirebaseAuthFailure('The multi-factor session is invalid.');
      case 'multi-factor-auth-required':
        return FirebaseAuthFailure('Multi-factor authentication is required.');
      case 'second-factor-already-enrolled':
        return FirebaseAuthFailure('This second factor is already enrolled.');
      case 'maximum-second-factor-count-exceeded':
        return FirebaseAuthFailure('You have reached the maximum number of second factors.');
      case 'unsupported-first-factor':
        return FirebaseAuthFailure('The first factor is not supported.');
      case 'unsupported-second-factor':
        return FirebaseAuthFailure('The second factor is not supported.');

    // ----- Unknown / Fallback -----
      default:
        return FirebaseAuthFailure('An unknown error occurred. Please try again.');
    }
  }

  @override
  String toString() => message;
}
