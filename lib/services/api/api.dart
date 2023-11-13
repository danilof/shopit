import 'package:shop_it/models/models.dart';

abstract class Api {
  Future<UsersResponse> getAllUsers();

  Future<AuthUser> login(String username, String password);
}
