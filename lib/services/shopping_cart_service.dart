import 'package:collection/collection.dart';
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

  bool get hasCart => _cart != null && _cart!.products.isNotEmpty;

  int get total => _calculateTotal();

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
        log.i("No existing cart for user, create empty cart");
        _cart = Cart.empty();
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  void addProduct(Product item) {
    CartProduct cartProduct = CartProduct.fromProduct(item, 1);

    var product =
        _cart!.products.firstWhereOrNull((element) => element.id == item.id);
    if (product != null) {
      log.i("Product exists update quantity");
      product = product.copyWith(quantity: product.quantity + 1);
      _cart!.products[_cart!.products
          .indexWhere((element) => element.id == product!.id)] = product;

      notifyListeners();
    } else {
      log.i("Product does not exists add it");
      _cart!.products.add(cartProduct);
      notifyListeners();
    }
  }

  void removeProduct(int productId) {
    _cart!.products.removeWhere((element) => element.id == productId);
    log.i("Product is removed");
    notifyListeners();
  }

  void productReduceQuantity(int productId) {
    _updateQuantityForProduct(productId, -1);
    notifyListeners();
  }

  void productAddToQuantity(int productId) {
    _updateQuantityForProduct(productId, 1);
    notifyListeners();
  }

  void _updateQuantityForProduct(int productId, int quantityStep) {
    int index =
        _cart!.products.indexWhere((element) => element.id == productId);
    CartProduct cartProduct = _cart!.products[index];
    if (quantityStep == -1 && cartProduct.quantity == 1) {
      return;
    }
    _cart!.products[index] =
        cartProduct.copyWith(quantity: cartProduct.quantity + quantityStep);
  }

  _calculateTotal() {
    double total = 0;
    for (CartProduct item in _cart!.products) {
      total += item.discountedPrice * item.quantity;
    }
    return total.ceil();
  }
}
