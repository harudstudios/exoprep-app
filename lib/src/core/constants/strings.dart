/// String constants for the application
/// Centralizes all user-facing strings for easy localization
class AppStrings {
  AppStrings._();

  /*------------ App Info ------------*/
  static const String appName = 'ExoPrep';
  static const String appVersion = '1.0.0';

  /*------------ Common Actions ------------*/
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String update = 'Update';
  static const String refresh = 'Refresh';
  static const String retry = 'Retry';
  static const String loading = 'Loading...';
  static const String pleaseWait = 'Please wait...';

  /*------------ Authentication ------------*/
  static const String login = 'Login';
  static const String logout = 'Logout';
  static const String register = 'Register';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String username = 'Username';

  /*------------ Validation Messages ------------*/
  static const String fieldRequired = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String passwordTooShort = 'Password must be at least 8 characters';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String invalidPhoneNumber = 'Please enter a valid phone number';

  /*------------ Error Messages ------------*/
  static const String genericError = 'Something went wrong. Please try again.';
  static const String networkError = 'Network error. Please check your connection.';
  static const String timeoutError = 'Request timed out. Please try again.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unauthorized = 'Unauthorized access. Please login again.';
  static const String notFound = 'Requested resource not found.';
  static const String noInternetConnection = 'No internet connection available.';

  /*------------ Success Messages ------------*/
  static const String loginSuccessful = 'Login successful!';
  static const String logoutSuccessful = 'Logout successful!';
  static const String registrationSuccessful = 'Registration successful!';
  static const String passwordResetSent = 'Password reset link sent to your email.';
  static const String profileUpdated = 'Profile updated successfully!';
  static const String settingsSaved = 'Settings saved successfully!';

  /*------------ Navigation ------------*/
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String about = 'About';
  static const String help = 'Help';
  static const String contactUs = 'Contact Us';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsOfService = 'Terms of Service';

  /*------------ Empty States ------------*/
  static const String noDataAvailable = 'No data available';
  static const String noResultsFound = 'No results found';
  static const String noNotifications = 'No notifications yet';
  static const String emptyList = 'List is empty';

  /*------------ Connectivity ------------*/
  static const String connectionRestored = 'Connection restored!';
  static const String connectionLost = 'Connection lost. Please check your internet.';
  static const String offlineMode = 'You are currently offline';

  /*------------ Permissions ------------*/
  static const String cameraPermissionRequired = 'Camera permission is required';
  static const String storagePermissionRequired = 'Storage permission is required';
  static const String locationPermissionRequired = 'Location permission is required';
  static const String microphonePermissionRequired = 'Microphone permission is required';
  static const String permissionDenied = 'Permission denied';
  static const String permissionGranted = 'Permission granted';
}
