import 'package:flutter/material.dart';

import '../../routes/route_page.dart';
import '../view/loading_view.dart';
import 'SUSPage.dart';


class LoadingPage extends SUSPage<void> {
  LoadingPage()
      : super(
          keyValue: InitialPageRoutes.loading,
          routeName: InitialPageRoutes.loading,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const LoadingView(),
    );
  }
}
