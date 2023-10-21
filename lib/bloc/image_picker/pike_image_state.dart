part of 'pike_image_bloc.dart';

@immutable
sealed class PikeImageState {}

final class PikeImageInitial extends PikeImageState {}

class ImageLoaddedState extends PikeImageState {
  final File? logo;

  ImageLoaddedState({required this.logo});
}
