import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:shop_it/services/shopping_cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger("StartupViewModel");
  final _navigationService = locator<NavigationService>();
  final _userService = locator<AuthService>();
  final _shoppingCartService = locator<ShoppingCartService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    try {
      log.i("init user service");
      await _userService.init();
      _userService.currentUserExist
          ? _navigationService.replaceWithHomeView()
          : _navigationService.replaceWithLoginView();
    } catch (e) {
      log.e(e);
      _navigationService.replaceWithLoginView();
    }
  }
}
