import 'package:shop_it/app/app.bottomsheets.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final log = getLogger("LoginViewModel");
  final _navigationService = locator<NavigationService>();
  final _userService = locator<AuthService>();
  final _sheetService = locator<BottomSheetService>();

  User? selectedUser;
  String selectedUserValidator = "";

  selectUser() async {
    selectedUser = await _navigationService.navigateToUsersView();
    notifyListeners();
  }

  Future<void> login() async {
    if (selectedUser == null) {
      log.i('we do not have selected user -> show validator message');
      selectedUserValidator =
          allTranslations.text("text_user_validation_error").toString();
      notifyListeners();
      return;
    }
    setBusy(true);
    try {
      log.i('try to login');
      await _userService.login(selectedUser!.username, selectedUser!.password);
      log.i('login success -> go to home');
      setBusy(false);
      _navigationService.replaceWithHomeView();
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
