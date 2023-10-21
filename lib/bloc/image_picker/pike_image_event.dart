part of 'pike_image_bloc.dart';

@immutable
sealed class PikeImageEvent {}
  class PikeImagegallaryEvent extends PikeImageEvent{

     File f;
  PikeImagegallaryEvent(this.f);
  }
