import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/api/api.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartService with ListenableServiceMixin {
  final log = getLogger("ShoppingCartService");
  final _api = locator<Api>();
  final _authService = locator<AuthService>();

  Cart? _cart;

  Cart? get currentCart => _cart;

  bool get hasCart => _cart != null;

  Future<void> initUserCart() async {
    try {
      int userId = _authService.currentUser!.id;
      log.i("get Cart for user: $userId start");
      CartsResponse response = await _api.getCartsForUser(userId);
      log.i("get Cart for user success");
      if (response.carts.isNotEmpty) {
        log.i("We have existing cart for user use it");
        _cart = response.carts.first;
        notifyListeners();
      } else {
        log.i("No existing cart for user");
        _cart = null;
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }
}
