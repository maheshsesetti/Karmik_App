
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(const AppStateInitial()) {
    on<CheckAppStateEvent>((event, emit) {
      emit(const AppLoginState());
    });
  }
}
