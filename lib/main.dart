import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_it/app/app.bottomsheets.dart';
import 'package:shop_it/app/app.dialogs.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/app/router.logger.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

final log = getLogger("Main");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  log.i("App initialization start");
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await allTranslations.init("en");
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  log.i("App initialization done");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FlexSchemeColor schemeLight = FlexSchemeColor.from(
      primary: kcPrimaryColorGreen,
      secondary: kcPrimaryColorGreen,
      brightness: Brightness.light,
    );

    final FlexSchemeColor schemeDark = FlexSchemeColor.from(
      primary: kcPrimaryColorGreen,
      secondary: kcPrimaryColorGreen,
      brightness: Brightness.dark,
    );

    final ThemeData lightTheme = FlexThemeData.light(
        scheme: FlexScheme.redM3, colors: schemeLight, useMaterial3: true);
    final ThemeData darkTheme = FlexThemeData.dark(
        scheme: FlexScheme.green, colors: schemeDark, useMaterial3: true);
    return MaterialApp(
      title: 'ShopIT',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
        RouteLoggingObserver(),
      ],
    );
  }
}
