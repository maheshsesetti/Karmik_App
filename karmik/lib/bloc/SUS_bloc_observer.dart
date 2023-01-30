
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SUSBlocObserver extends BlocObserver{
   @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('blocOnChange');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('blocOnEvent');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('blocOnError');
    log('error $stackTrace');
    
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('blocOnCreate');
  }
}