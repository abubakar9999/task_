part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;
  final String macAddress;

    LoginButtonPressed({
    required this.phone,
    required this.password,
    required this.macAddress,
  });


}