import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<AuthService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _userService.init();
    _userService.currentUserExist
        ? _navigationService.replaceWithHomeView()
        : _navigationService.replaceWithLoginView();
  }
}
