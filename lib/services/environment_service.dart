import 'package:shop_it/enums/environment.dart';

/// Loads all the required environment values
class EnvironmentService {
  static const String kEnvDevelopment = 'Development';
  static const String kEnvProduction = 'Production';
  static const String kEnvStaging = 'Staging';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );
  static const String baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: "https://dummyjson.com");

  static const bool translationHelperActive =
      bool.fromEnvironment('TRANSLATION_HELPER_ACTIVE', defaultValue: false);
  static const bool apiLoggerRequestEnabled =
      bool.fromEnvironment('API_LOGGER_REQUEST_ENABLED', defaultValue: false);
  static const bool apiLoggerResponseEnabled =
      bool.fromEnvironment('API_LOGGER_RESPONSE_ENABLED', defaultValue: false);
  static const bool useFakeApi =
      bool.fromEnvironment('USE_FAKE_API', defaultValue: false);

  static bool get isDevelopment =>
      currentEnvironment == Environment.development;

  static bool get isProduction => currentEnvironment == Environment.production;

  static bool get isStaging => currentEnvironment == Environment.staging;

  static Environment get currentEnvironment {
    switch (environment) {
      case kEnvDevelopment:
        return Environment.development;
      case kEnvProduction:
        return Environment.production;
      case kEnvStaging:
        return Environment.staging;
      default:
        return Environment.development;
    }
  }
}
