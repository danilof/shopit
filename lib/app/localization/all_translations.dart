import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/services/environment_service.dart';

final log = getLogger("Translator");

///
/// Preferences related
///
//const String _storageKey = "MyApplication_";
const List<String> _supportedLanguages = ['sl'];
//Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GlobalTranslations {
  //static var shared = GlobalTranslations()
  Locale? _locale;
  Map<dynamic, dynamic>? _localizedValues;
  VoidCallback? _onLocaleChangedCallback;

  ///
  /// Returns the list of supported Locales
  ///
  Iterable<Locale> supportedLocales() =>
      _supportedLanguages.map<Locale>((lang) => Locale(lang, ''));

  ///
  /// Returns the translation that corresponds to the [key]
  ///
  String? text(String key) {
    // Return the requested string
    String result;
    if (_localizedValues == null || _localizedValues![key] == null) {
      result = '** $key not found';
      if (EnvironmentService.translationHelperActive) {
        log.wtf('new key: "$key":"$key",');
      }

      return result;
    }
    return EnvironmentService.translationHelperActive
        ? "[T] ${_localizedValues![key]}"
        : _localizedValues![key];
  }

  ///
  /// Returns the translation that corresponds to the [key]
  ///
  String? textWithArgs(String key, String argName, String argValue) {
    // Return the requested string
    return (_localizedValues == null || _localizedValues![key] == null)
        ? '** $key not found'
        : _returnTextWithArgs(_localizedValues![key], argName, argValue);
  }

  _returnTextWithArgs(String value, String argName, String argValue) {
    if (value.contains("##$argName##")) {
      return value.replaceAll("##$argName##", argValue);
    } else {
      return '** arg $argName not found';
    }
  }

  ///
  /// Returns the current language code
  ///
  get currentLanguage => _locale == null ? '' : _locale!.languageCode;

  ///
  /// Returns the current Locale
  ///
  get locale => _locale;

  ///
  /// One-time initialization
  ///
  Future<void> init([String? language]) async {
    if (_locale == null) {
      await setNewLanguage(language);
    }
  }

  ///
  /// Routine to change the language
  ///
  Future<void> setNewLanguage(
      [String? newLanguage, bool saveInPrefs = false]) async {
    String? language = newLanguage;

    // Set the locale
    if (language == "" || language == null) {
      language = "en";
    }
    _locale = Locale(language, "");

    // Load the language strings
    String jsonContent =
        await rootBundle.loadString("locale/${_locale!.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    // If there is a callback to invoke to notify that a language has changed
    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback!();
    }
  }

  ///
  /// Callback to be invoked when the user changes the language
  ///
  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  ///
  /// Singleton Factory
  ///
  static final GlobalTranslations _translations =
      GlobalTranslations._internal();
  factory GlobalTranslations() {
    return _translations;
  }
  GlobalTranslations._internal();
}

GlobalTranslations allTranslations = GlobalTranslations();
