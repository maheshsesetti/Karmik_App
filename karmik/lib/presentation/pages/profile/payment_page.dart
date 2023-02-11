import 'package:flutter/material.dart';


import '../../../routes/route_page.dart';
import '../../view/Profile/payment_view.dart';
import '../SUSPage.dart';

class PaymentPage extends SUSPage<void> {
  PaymentPage()
      : super(
      keyValue: InitialPageRoutes.payment,
      routeName: InitialPageRoutes.payment);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const PaymentView(),
    );
  }
}
