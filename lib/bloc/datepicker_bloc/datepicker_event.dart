part of 'datepicker_bloc.dart';

@immutable
sealed class DatepickerEvent {}

class PickedDate extends DatepickerEvent {
  DateTime selectDatae;
  
  PickedDate({required this.selectDatae,});
}
