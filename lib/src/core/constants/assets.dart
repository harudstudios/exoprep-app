/// Asset path constants for the application
/// Centralizes asset management and prevents typos
class AppAssets {
  AppAssets._();

  /*------------- Base Paths -------------*/
  static const _baseImagePath = 'assets/images/';
  static const _baseLottiePath = 'assets/lottie/';
  static const _baseIconPath = 'assets/icons/';
  // static const _baseFontPath = 'assets/fonts/';

  /*------------- File Extensions -------------*/
  static const _pngFormat = '.png';
  // static const _jpgFormat = '.jpg';
  static const _jsonFormat = '.json';
  // static const _svgFormat = '.svg';

  /*------------ App Icons ------------*/
  static String get appLogo => '${_baseIconPath}logo$_pngFormat';
  // static String get appIcon => '${_baseIconPath}app_icon$_pngFormat';
  static String get googleIcon => '${_baseIconPath}google$_pngFormat';

  /*------------ Images ------------*/
  static String get placeholder => '${_baseImagePath}placeholder$_pngFormat';
  static String get errorPlaceholder =>
      '${_baseImagePath}error_placeholder$_pngFormat';
  static String get noDataPlaceholder => '${_baseImagePath}no_data$_pngFormat';

  /*------------ Onboarding Images ------------*/
  static String get onboarding1 => '${_baseImagePath}onboarding_1$_pngFormat';
  static String get onboarding2 => '${_baseImagePath}onboarding_2$_pngFormat';
  static String get onboarding3 => '${_baseImagePath}onboarding_3$_pngFormat';

  /*------------ Lottie Animations ------------*/
  static String get loadingAnimation => '${_baseLottiePath}loading$_jsonFormat';
  static String get successAnimation => '${_baseLottiePath}success$_jsonFormat';
  static String get errorAnimation => '${_baseLottiePath}error$_jsonFormat';
  static String get emptyStateAnimation =>
      '${_baseLottiePath}empty_state$_jsonFormat';

  /*------------ Fonts ------------*/
  static const String poppinsFont = 'Poppins';
  static const String robotoFont = 'Roboto';
}
