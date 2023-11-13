import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/api/api.dart';

class UsersService {
  final log = getLogger("UsersService");
  final _api = locator<Api>();

  Future<List<User>> getUsers() async {
    try {
      log.i("getAllUsers start");
      UsersResponse response = await _api.getAllUsers();
      log.i("getAllUsers success");
      return response.users;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  Future<List<User>> searchUsers(String query) async {
    try {
      log.i("search users with query $query");
      UsersResponse response = await _api.searchUsers(query);
      log.i("getAllUsers success");
      return response.users;
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }
}
