part of 'theam_bloc.dart';

@immutable
sealed class TheamEvent {}

class TheamChangeEvent extends TheamEvent {
  final bool isDark;

  TheamChangeEvent({required this.isDark});


}
