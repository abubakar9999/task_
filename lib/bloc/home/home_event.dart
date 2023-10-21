part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLodingEvent extends HomeEvent {}

class HomeLodedEvent extends HomeEvent {
  

}
