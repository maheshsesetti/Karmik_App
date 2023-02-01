
import 'package:routemaster/routemaster.dart';

import '../presentation/pages/HomePage/home_page.dart';
import '../presentation/pages/loadingPage.dart';
import '../presentation/pages/login/loginPage.dart';

class InitialPageRoutes {
  static const loading = '/loading';
  static const login = '/login';
  static const homepage = '/homepage';
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
      InitialPageRoutes.homepage:(_)=>HomePage(),
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.login),
  );
}
