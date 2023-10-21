import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pike_image_event.dart';
part 'pike_image_state.dart';

class PikeImageBloc extends Bloc<PikeImageEvent, PikeImageState> {
  PikeImageBloc() : super(PikeImageInitial()) {
    on<PikeImagegallaryEvent>((event, emit) {
      emit(ImageLoaddedState(logo: event.f));
    });
  }
}
