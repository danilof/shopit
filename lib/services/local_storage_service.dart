import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';

final log = getLogger('LocalStorageService');

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static const String userKey = 'pref_user';

  Future<void> init() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
  }

  AuthUser? get user {
    String? userString = _getFromPreferences(userKey);
    if (userString == null) {
      return null;
    }
    return AuthUser.fromJson(json.decode(userString));
  }

  set user(AuthUser? user) {
    if (user != null) {
      var jsonText = jsonEncode(user);
      _saveStringToPreferences(userKey, jsonText);
    } else {
      _clearFromPreferences(userKey);
    }
  }

  //helpers
  dynamic _getFromPreferences(String key) {
    var value = _preferences!.get(key);
    // log.i('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveStringToPreferences(String key, String content) {
    log.i(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences!.setString(key, content);
  }

/*
  void _saveIntToPreferences(String key, int content) {
    log.i(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences!.setInt(key, content);
  }
*/
  void _clearFromPreferences(String key) {
    log.i('(TRACE) LocalStorageService:_clearFromDisk. key: $key');
    _preferences!.remove(key);
  }

  void clearAll() {
    _preferences!.clear();
  }
}
