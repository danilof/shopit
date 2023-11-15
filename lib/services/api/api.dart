import 'package:shop_it/models/models.dart';

abstract class Api {
  Future<AuthUser> login(String username, String password);

  Future<UsersResponse> getAllUsers();

  Future<UsersResponse> searchUsers(String query);

  Future<ProductsResponse> getProducts();

  Future<ProductsResponse> searchProducts(String query);

  Future<CartsResponse> getCartsForUser(int userId);
}
