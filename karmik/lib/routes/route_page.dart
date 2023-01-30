import 'package:routemaster/routemaster.dart';

import '../presentation/pages/loadingPage.dart';
import '../presentation/pages/login/loginPage.dart';

class InitialPageRoutes {
  static const loading = '/loading';
  static const login = '/login';
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
    },
    onUnknownRoute: (path) =>
    const Redirect(InitialPageRoutes.login),
  );
}
