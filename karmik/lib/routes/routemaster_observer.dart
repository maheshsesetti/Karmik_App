import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RouteMasterObserver extends RoutemasterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('Pushed ${route.settings.name}');
    super.didPush(route, previousRoute);
  }
  @override
  void didPop(Route route, Route? previousRoute) {
    log('Popped ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log(
        'Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
    super.didReplace(oldRoute: oldRoute, newRoute: newRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log(
        'Removed ${previousRoute?.settings.name}, back to ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }
}
