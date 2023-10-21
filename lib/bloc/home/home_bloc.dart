import 'package:bloc/bloc.dart';
import 'package:interview_task/service/repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLodedEvent>((event, emit) {
      print("hitted");
      emit(HomeLodingState());
      print("hitted2");

      Future.delayed(const Duration(seconds: 3));
      print("hitted3");

      Map data = Repository().home();
      print(data);

      emit(HomeLodetState(data: data));

      // TODO: implement event handler
    });
  }
}
