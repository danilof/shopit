import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';

class CartBadgeModel extends ReactiveViewModel {
  final log = getLogger("CartBadgeModel");
  final _shoppingCartService = locator<ShoppingCartService>();

  int get numOf =>
      hasProducts ? _shoppingCartService.currentCart!.products.length : 0;

  bool get hasProducts => _shoppingCartService.hasCart;

  @override
  List<ListenableServiceMixin> get listenableServices => [_shoppingCartService];
}
