import 'package:shop_it/app/app.bottomsheets.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/shop_products_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductsViewModel extends BaseViewModel {
  final log = getLogger("ProductsViewModel");
  final _navigationService = locator<NavigationService>();
  final _productsService = locator<ShopProductsService>();
  final _sheetService = locator<BottomSheetService>();

  bool _isListModeActive = false;

  bool get isListModeActive => _isListModeActive;

  bool get isListEmpty => _products.isEmpty;

  List<Product> get products => _products;

  List<Product> _products = [];

  void getProducts() async {
    try {
      log.i("get products start");
      setBusy(true);
      _products = await _productsService.getProducts();
      log.i("get products success");
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log.e(e.toString());
      await _sheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: allTranslations.text("label_error").toString(),
          description: e.toString());
    }
  }

  goToSelectedProduct(Product item) {
    log.i("go to product with id: ${item.id}");
    //_navigationService.navi.back(result: item);
  }

  searchProducts(String query) async {
    try {
      log.i("search products - query: $query");
      setBusy(true);
      _products = await _productsService.searchProducts(query);
      log.i("search results length: ${_products.length}");
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log.e(e.toString());
      await _sheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: allTranslations.text("label_error").toString(),
          description: e.toString());
    }
  }

  void toggleView() {
    _isListModeActive = !_isListModeActive;
    notifyListeners();
  }

  addToCart(Product item) {
    log.i("Add to cart product with id: ${item.title}");
  }
}
