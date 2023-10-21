import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'datepicker_event.dart';
 

class DatepickerBloc extends Bloc<DatepickerEvent, DateTime> {
  DatepickerBloc() : super(DateTime.now()) {
    on<PickedDate>((event, emit)async {

     
    });
  }
}
