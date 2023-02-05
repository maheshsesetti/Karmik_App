import 'package:flutter/material.dart';


import '../../../routes/route_page.dart';
import '../../view/Profile/profile_view.dart';
import '../SUSPage.dart';

class ProfilePage extends SUSPage<void> {
  ProfilePage()
      : super(
      keyValue: InitialPageRoutes.profile,
      routeName: InitialPageRoutes.profile);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const ProfileView(),
    );
  }
}
