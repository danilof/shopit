import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';

class CartModel extends ReactiveViewModel {
  final log = getLogger("CartModel");
  final _shoppingCartService = locator<ShoppingCartService>();

  get total => _shoppingCartService.total;

  Cart? get cart => _shoppingCartService.currentCart;

  bool get hasProducts => _shoppingCartService.hasCart;

  @override
  List<ListenableServiceMixin> get listenableServices => [_shoppingCartService];

  Future<void> initCart() async {
    log.i("init shopping cart");
    await _shoppingCartService.initUserCart();
  }

  removeFromCart(int productId) {
    log.i("plus product for item $productId");
    _shoppingCartService.removeProduct(productId);
  }

  plusQuantity(int productId) {
    log.i("add to product quantity for item $productId");
    _shoppingCartService.productAddToQuantity(productId);
  }

  minusQuantity(int productId) {
    log.i("minus product for item $productId");
    _shoppingCartService.productReduceQuantity(productId);
  }
}
