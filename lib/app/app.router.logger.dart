import 'package:flutter/material.dart';
import 'package:shop_it/app/app.logger.dart';

final log = getLogger("RouteObserver");

class RouteLoggingObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.d(
        'route.name: ${route.settings.name}, previousRoute.name: ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.d(
        'route.name: ${route.settings.name}, previousRoute.name: ${previousRoute?.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.d(
        'route.name: ${route.settings.name}, previousRoute.name: ${previousRoute?.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log.d(
        'newRoute.name: ${newRoute?.settings.name}, oldRoute.name: ${oldRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
