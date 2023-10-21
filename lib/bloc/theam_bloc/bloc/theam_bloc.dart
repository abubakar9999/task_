import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theam_event.dart';

class ThemeBloc extends Bloc<TheamEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.dark) {
    on<TheamChangeEvent>((event, emit) {
      print("hitted bloe");
      print(event.isDark);
      emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
