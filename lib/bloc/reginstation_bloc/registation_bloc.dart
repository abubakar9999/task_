import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:interview_task/service/repository.dart';
 

part 'registation_event.dart';
part 'registation_state.dart';

class RegistationBloc extends Bloc<RegEvent, RegState> {
  RegistationBloc() : super(InitialRegState()) {
   on<RegButtonPressed>((event, emit) async {
      // emit(LoadingState());
      var response = await Repository()
          .singUp(event.name,event.email,event.phone,event.countrycode, event.gender,event.dob,event.divisionId,event.districId,event.adderss,event.password,event.macadderss,event.photo);

      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        emit(RegSuccessState(isSucess: true));
      } else {
        emit(RegFailureState(error: ""));
      }
    });
  }
}
