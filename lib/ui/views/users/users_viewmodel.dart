import 'package:shop_it/app/app.bottomsheets.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  final log = getLogger("UsersViewModel");
  final _navigationService = locator<NavigationService>();
  final _usersService = locator<UsersService>();
  final _sheetService = locator<BottomSheetService>();

  bool get isListEmpty => _users.isEmpty;

  List<User> get users => _users;

  List<User> _users = [];

  void getUsers() async {
    try {
      log.i("getAllUsers start");
      setBusy(true);
      _users = await _usersService.getUsers();
      log.i("getAllUsers success");
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

  selectAndReturn(User item) {
    _navigationService.back(result: item);
  }

  searchUsers(String query) async {
    try {
      log.i("search users - query: $query");
      setBusy(true);
      _users = await _usersService.searchUsers(query);
      log.i("search results length: ${_users.length}");
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
}
