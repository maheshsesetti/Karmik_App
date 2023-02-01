import 'package:flutter/material.dart';


import '../../../routes/route_page.dart';
import '../../view/HomeView/home_view.dart';
import '../SUSPage.dart';

class HomePage extends SUSPage<void> {
  HomePage()
      : super(
            keyValue: InitialPageRoutes.homepage,
            routeName: InitialPageRoutes.homepage);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const HomeView(),
    );
  }
}