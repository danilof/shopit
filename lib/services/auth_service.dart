import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/api/api.dart';
import 'package:shop_it/services/local_storage_service.dart';

class AuthService {
  final log = getLogger("AuthService");
  final _localStorage = locator<LocalStorageService>();
  final _apiService = locator<Api>();
  AuthUser? _currentUser;

  bool get currentUserExist => _currentUser != null;

  AuthUser? get currentUser => _currentUser;

  init() {
    log.i("start init");
    if (_localStorage.user != null) {
      log.i("we have saved user in prefs, use it as a current user");
      _currentUser = _localStorage.user;
    }
  }

  login(String username, String password) async {
    try {
      log.i("try to login with username: $username");
      _currentUser = await _apiService.login(username, password);
      _localStorage.user = _currentUser;
      log.i("login success");
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  logout() {
    _localStorage.user = null;
  }
}
