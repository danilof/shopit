import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/api/api.dart';

class ShopProductsService {
  final log = getLogger("ShopProductsService");
  final _api = locator<Api>();

  Future<List<Product>> getProducts() async {
    try {
      log.i("getProducts start");
      ProductsResponse response = await _api.getProducts();
      log.i("getProducts success");
      return response.products;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      log.i("search products with query $query");
      ProductsResponse response = await _api.searchProducts(query);
      log.i("search success");
      return response.products;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }
}
