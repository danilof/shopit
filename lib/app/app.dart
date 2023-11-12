import 'package:shop_it/ui/common/design_system/design_system_view.dart';
import 'package:shop_it/ui/common/info_alert/info_alert_dialog.dart';
import 'package:shop_it/ui/views/home/home_view.dart';
import 'package:shop_it/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shop_it/services/environment_service.dart';
import 'package:shop_it/ui/views/products/products_view.dart';
import "package:shop_it/services/api/api_service.dart";

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: ProductsView),
  MaterialRoute(page: DesignSystemView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: EnvironmentService),
  LazySingleton(classType: ApiService),
// @stacked-service
], dialogs: [
  StackedDialog(classType: InfoAlertDialog),
  // @stacked-dialog
], logger: StackedLogger())
class App {}