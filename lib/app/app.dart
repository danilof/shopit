import 'package:shop_it/services/api/api.dart';
import "package:shop_it/services/api/api_service.dart";
import 'package:shop_it/services/auth_service.dart';
import 'package:shop_it/services/environment_service.dart';
import 'package:shop_it/services/local_storage_service.dart';
import 'package:shop_it/services/shop_products_service.dart';
import 'package:shop_it/services/shopping_cart_service.dart';
import 'package:shop_it/services/users_service.dart';
import 'package:shop_it/ui/common/design_system/design_system_view.dart';
import 'package:shop_it/ui/common/info_alert/info_alert_dialog.dart';
import 'package:shop_it/ui/common/notice/notice_sheet.dart';
import 'package:shop_it/ui/views/home/home_view.dart';
import 'package:shop_it/ui/views/login/login_view.dart';
import 'package:shop_it/ui/views/product_detail/product_detail_view.dart';
import 'package:shop_it/ui/views/products/products_view.dart';
import 'package:shop_it/ui/views/shopping_cart/shopping_cart_view.dart';
import 'package:shop_it/ui/views/startup/startup_view.dart';
import 'package:shop_it/ui/views/user_profile/user_profile_view.dart';
import 'package:shop_it/ui/views/users/users_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: ProductsView),
  MaterialRoute(page: DesignSystemView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: UsersView),
  MaterialRoute(page: UserProfileView),
  MaterialRoute(page: ShoppingCartView),
  MaterialRoute(page: ProductDetailView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: EnvironmentService),
  LazySingleton(classType: ApiService, asType: Api),
  InitializableSingleton(classType: LocalStorageService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: UsersService),
  LazySingleton(classType: ShopProductsService),
  LazySingleton(classType: ShoppingCartService),
// @stacked-service
], bottomsheets: [
  StackedBottomsheet(classType: NoticeSheet)
// @stacked-bottom-sheet
], dialogs: [
  StackedDialog(classType: InfoAlertDialog),
  // @stacked-dialog
], logger: StackedLogger())
class App {}
