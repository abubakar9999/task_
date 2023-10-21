import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:interview_task/service/repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginButtonPressed>((event, emit) async {
      // emit(LoadingState());
      var response = await Repository()
          .login(event.phone, event.password, event.macAddress);

      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        emit(LoginSuccessState(isSucess: true));
      } else {
        emit(LoginFailureState(error: ""));
      }
    });
  }
}
