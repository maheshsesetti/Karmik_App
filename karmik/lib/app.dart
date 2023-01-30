

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/core/const/constant.dart';

import 'package:routemaster/routemaster.dart';

import 'bloc/SUS_bloc_observer.dart';
import 'bloc/app_state_bloc.dart';
import 'presentation/widget/appscreenwidget.dart';
import 'routes/route_page.dart';
import 'routes/routemaster_observer.dart';


void initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SUSBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppStateBloc>(
            create: (context) =>
                AppStateBloc()..add(const CheckAppStateEvent()),
          ),
        ],
        child: App(
          observerList: [
            RouteMasterObserver(),
          ],
        ));
  }
}

class App extends StatefulWidget {
  final List<RouteMasterObserver> observerList;
  const App({super.key, this.observerList = const []});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final RoutemasterDelegate routemasterDelegate;

  @override
  void initState() {
    routemasterDelegate = RoutemasterDelegate(
        observers: widget.observerList,
        routesBuilder: (context) {
          final state = BlocProvider.of<AppStateBloc>(context).state;
          if (state is AppLoginState) {
            return PageRoutes.login;
          } else {
            return PageRoutes.loading;
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          AppConsts.screenHeight,
          AppConsts.screenWidth
      ),
      builder: (context,child) {
        return BlocBuilder<AppStateBloc, AppStateState>(
          builder: (context, state) {
            return MaterialApp.router(
              // title: 'Loading ...',
              key: ObjectKey(state),
              debugShowCheckedModeBanner: false,
              routeInformationParser: const RoutemasterParser(),
              routerDelegate: routemasterDelegate,
              builder: (context, child) => AppScreenWidget(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            );
          },
        );
      }
    );
  }
}
