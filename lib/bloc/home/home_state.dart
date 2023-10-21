part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLodingState extends HomeState {}

final class HomeLodetState extends HomeState {
  Map data;
  HomeLodetState({required this.data});
}
