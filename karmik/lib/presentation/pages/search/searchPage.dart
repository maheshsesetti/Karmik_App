import 'package:flutter/material.dart';


import '../../../routes/route_page.dart';
import '../../view/search/search_view.dart';
import '../SUSPage.dart';

class SearchPage extends SUSPage<void> {
 SearchPage()
      : super(
            keyValue: InitialPageRoutes.search,
            routeName: InitialPageRoutes.search);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const SearchView(),
    );
  }
}