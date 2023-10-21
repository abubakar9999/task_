part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});
}

// ignore: must_be_immutable
class LoginSuccessState extends LoginState {
  bool isSucess;

  LoginSuccessState({required this.isSucess});
}
