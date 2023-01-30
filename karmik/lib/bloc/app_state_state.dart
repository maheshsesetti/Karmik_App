part of 'app_state_bloc.dart';

abstract class AppStateState extends Equatable {
  const AppStateState();
  @override
  List<Object?> get props => [];
}

class AppStateInitial extends AppStateState {
  const AppStateInitial();

   @override
  List<Object> get props => [];
}

class AppLoginState extends AppStateState {
  const AppLoginState();

   @override
  List<Object> get props => [];

}
