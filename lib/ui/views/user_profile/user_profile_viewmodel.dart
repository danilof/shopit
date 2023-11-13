import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  AuthUser get currentUser => _authService.currentUser!;

  void logout() {
    _authService.logout();
    _navigationService.replaceWithLoginView();
  }
}
