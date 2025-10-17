/// Environment configuration for different build flavors
/// Centralizes environment-specific settings and feature flags
abstract class Env {
  // Environment constants
  static const String dev = 'dev';
  static const String stage = 'stage';
  static const String prod = 'prod';

  /// Get current environment from build configuration
  static String get current => const String.fromEnvironment('FLAVOR', defaultValue: dev);

  /// Environment checks
  static bool get isDev => current == dev;
  static bool get isStage => current == stage;
  static bool get isProd => current == prod;
  static bool get isDebugMode => isDev || isStage;

  /*------------ API Configuration ------------*/
  
  /// Base API URL for different environments
  static String get apiBaseUrl {
    switch (current) {
      case dev:
        return 'https://dev-api.yourapp.com/api/v1';
      case stage:
        return 'https://stage-api.yourapp.com/api/v1';
      case prod:
        return 'https://api.yourapp.com/api/v1';
      default:
        return 'https://dev-api.yourapp.com/api/v1';
    }
  }

  /// WebSocket URL for real-time features
  static String get websocketUrl {
    switch (current) {
      case dev:
        return 'wss://dev-ws.yourapp.com';
      case stage:
        return 'wss://stage-ws.yourapp.com';
      case prod:
        return 'wss://ws.yourapp.com';
      default:
        return 'wss://dev-ws.yourapp.com';
    }
  }

  /*------------ Database Configuration ------------*/
  
  /// Database name for local storage
  static String get databaseName {
    switch (current) {
      case dev:
        return 'yourapp_dev.db';
      case stage:
        return 'yourapp_stage.db';
      case prod:
        return 'yourapp.db';
      default:
        return 'yourapp_dev.db';
    }
  }

  /*------------ Storage Configuration ------------*/
  
  /// SharedPreferences key prefix
  static String get prefsPrefix {
    switch (current) {
      case dev:
        return 'yourapp_dev_';
      case stage:
        return 'yourapp_stage_';
      case prod:
        return 'yourapp_';
      default:
        return 'yourapp_dev_';
    }
  }

  /*------------ Feature Flags ------------*/
  
  /// Enable debug tools and overlays
  static bool get enableDebugTools => isDev;

  /// Enable performance monitoring
  static bool get enablePerformanceMonitoring => !isDev;

  /// Enable crash reporting
  static bool get enableCrashReporting => isProd || isStage;

  /// Enable analytics tracking
  static bool get enableAnalytics => isProd || isStage;

  /// Enable push notifications
  static bool get enablePushNotifications => true;

  /// Enable biometric authentication
  static bool get enableBiometricAuth => isProd || isStage;

  /// Enable offline mode
  static bool get enableOfflineMode => true;

  /// Enable experimental features
  static bool get enableExperimentalFeatures => isDev || isStage;

  /*------------ Network Configuration ------------*/
  
  /// Network timeout duration
  static Duration get networkTimeout {
    switch (current) {
      case dev:
        return const Duration(seconds: 60); // Longer timeout for dev
      case stage:
        return const Duration(seconds: 30);
      case prod:
        return const Duration(seconds: 15);
      default:
        return const Duration(seconds: 30);
    }
  }

  /// Maximum retry attempts for failed requests
  static int get maxRetryAttempts {
    switch (current) {
      case dev:
        return 1; // Less retries in dev for faster debugging
      case stage:
        return 2;
      case prod:
        return 3;
      default:
        return 2;
    }
  }

  /*------------ Logging Configuration ------------*/
  
  /// Enable verbose logging
  static bool get enableVerboseLogging => isDev;

  /// Enable network request/response logging
  static bool get enableNetworkLogging => isDev || isStage;

  /// Log level for different environments
  static String get logLevel {
    switch (current) {
      case dev:
        return 'verbose';
      case stage:
        return 'info';
      case prod:
        return 'warning';
      default:
        return 'info';
    }
  }

  /*------------ Security Configuration ------------*/
  
  /// Enable certificate pinning
  static bool get enableCertificatePinning => isProd;

  /// Enable code obfuscation (handled by build process)
  static bool get enableCodeObfuscation => isProd;

  /// Enable root/jailbreak detection
  static bool get enableRootDetection => isProd;

  /*------------ Cache Configuration ------------*/
  
  /// Cache duration for API responses
  static Duration get cacheDefaultDuration {
    switch (current) {
      case dev:
        return const Duration(minutes: 5); // Short cache in dev
      case stage:
        return const Duration(minutes: 15);
      case prod:
        return const Duration(hours: 1);
      default:
        return const Duration(minutes: 15);
    }
  }

  /// Maximum cache size in MB
  static int get maxCacheSizeMB {
    switch (current) {
      case dev:
        return 50;
      case stage:
        return 100;
      case prod:
        return 200;
      default:
        return 100;
    }
  }

  /*------------ App Configuration ------------*/
  
  /// App display name
  // static String get appDisplayName => '$DISPLAY_NAME';

  /// App bundle/package identifier
  /*
  static String get appBundleId {
    switch (current) {
      case dev:
        return '$ORG.${pkg}.dev';
      case stage:
        return '$ORG.${pkg}.stage';
      case prod:
        return '$ORG.${pkg}';
      default:
        return '$ORG.${pkg}.dev';
    }
  }
  */

  /// Show environment badge in app
  static bool get showEnvironmentBadge => !isProd;

  /*------------ Third-party Service Configuration ------------*/
  
  /// Google Services configuration file
  static String get googleServicesConfig {
    switch (current) {
      case dev:
        return 'google-services-dev.json';
      case stage:
        return 'google-services-stage.json';
      case prod:
        return 'google-services.json';
      default:
        return 'google-services-dev.json';
    }
  }

  /*------------ Debug Configuration ------------*/
  
  /// Enable debug banners and overlays
  static bool get showDebugBanner => isDev;

  /// Enable performance overlay
  static bool get showPerformanceOverlay => isDev;

  /// Enable widget inspector
  static bool get enableWidgetInspector => isDev;
}
