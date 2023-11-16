import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/shopping_cart_service.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:stacked/stacked.dart';

class ProductDetailViewModel extends BaseViewModel {
  final log = getLogger("ProductDetailViewModel");
  final _shoppingCartService = locator<ShoppingCartService>();

  addToCart(Product item) {
    log.i("Add to cart product: ${item.title}");
    _shoppingCartService.addProduct(item);
    Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        backgroundColor: kcPrimaryColorGreen,
        fontSize: 15,
        msg: allTranslations
            .textWithArgs("notice_product_added", "product", item.title)
            .toString());
  }
}
