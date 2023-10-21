part of 'registation_bloc.dart';

sealed class RegEvent {}

class RegButtonPressed extends RegEvent {
  String name;
  String email;
  String phone;
  String countrycode;
  String gender;
  String dob;
  int divisionId;
  int districId;
  String adderss;
  String password;
  String macadderss;
  String photo;

  RegButtonPressed(
      {required this.name,
      required this.email,
      required this.phone,
      required this.countrycode,
      required this.adderss,
      required this.districId,
      required this.divisionId,
      required this.dob,
      required this.gender,
      required this.macadderss,
      required this.password,
      required this.photo});
}
