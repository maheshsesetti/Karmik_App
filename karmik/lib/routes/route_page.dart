import 'package:routemaster/routemaster.dart';

import '../presentation/pages/HomePage/home_page.dart';
import '../presentation/pages/loadingPage.dart';
import '../presentation/pages/login/loginPage.dart';
import '../presentation/pages/profile/payment_page.dart';
import '../presentation/pages/profile/profile_page.dart';
import '../presentation/pages/search/searchPage.dart';

class InitialPageRoutes {
  static const loading = '/loading';
  static const login = '/login';
  static const homepage = '/homepage';
  static const search = '/search';
  static const profile = '/profile';
  static const payment = '/payment';
}

class PageRoutes {
  static final loading = RouteMap(
    routes: {
      InitialPageRoutes.loading: (_) => LoadingPage(),
    },
    onUnknownRoute: (path) =>
        Redirect(InitialPageRoutes.loading, queryParameters: {'path': path}),
  );

  static final login = RouteMap(
    routes: {
      InitialPageRoutes.login: (_) => LoginPage(),
      InitialPageRoutes.homepage: (_) => HomePage(),
      InitialPageRoutes.search: (_) => SearchPage(),
      InitialPageRoutes.profile: (_) => ProfilePage(),
      InitialPageRoutes.payment: (_) => PaymentPage(),
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.login),
  );
}
