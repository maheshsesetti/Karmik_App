part of 'app_state_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();

  @override
  List<Object?> get props => [];
}

class CheckAppStateEvent extends AppStateEvent {
  const CheckAppStateEvent();

   @override
  List<Object> get props => [];
}

class LoginAppStateEvent extends AppStateEvent {
  const LoginAppStateEvent();

   @override
  List<Object> get props => [];
}
