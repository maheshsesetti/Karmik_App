import 'package:flutter/material.dart';


import '../../../routes/route_page.dart';
import '../../view/login/loginView.dart';
import '../SUSPage.dart';

class LoginPage extends SUSPage<void> {
  LoginPage()
      : super(
            keyValue: InitialPageRoutes.login,
            routeName: InitialPageRoutes.login);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const LoginView(),
    );
  }
}
