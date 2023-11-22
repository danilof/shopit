import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:session_mate/session_mate.dart';
import 'package:shop_it/app/app.bottomsheets.dart';
import 'package:shop_it/app/app.dialogs.dart';
import 'package:shop_it/app/app.locator.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/app/app.router.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/app/router.logger.dart';
import 'package:shop_it/services/environment_service.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'flavors.dart';

final log = getLogger("Main");

Future<void> main() async {
  if (!kReplaySession) {
    WidgetsFlutterBinding.ensureInitialized();
  }
  await setupSessionMate();
  log.i("App initialization start");
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await allTranslations.init("lng_en");
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  //fix-http certifikati na starejsih napravah
  HttpOverrides.global = MyHttpOverrides();
  log.i("App initialization done");
  runApp(const MainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
      title: F.title,
      //debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
        RouteLoggingObserver(),
        SessionMateNavigatorObserver.instance,
      ],
      builder: (context, child) => SessionMateBuilder(
        minimumStartupTime: 6000,
        verboseLogs: true,
        inputMaskingEnabled: false,
        dataMaskingEnabled: false,
        child: _flavorBanner(child: child!, show: true),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: EnvironmentService.isProduction
                  ? Colors.green.withOpacity(0.6)
                  : Colors.orange.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
