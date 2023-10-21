part of 'registation_bloc.dart';


sealed class RegState {}

class InitialRegState extends RegState {}

class LoadingState extends RegState {}

class RegFailureState extends RegState {
  final String error;

  RegFailureState({required this.error});
}

// ignore: must_be_immutable
class RegSuccessState extends RegState {
  bool isSucess;

  RegSuccessState({required this.isSucess});
}
