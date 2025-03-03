// import 'package:bloc/bloc.dart';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_operations/repository/auth/login_repository.dart';
import 'package:bloc_operations/services/session_manager/session_controller.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
// part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailchanged);
    on<PasswordChanged>(_onPasswordchanged);
    on<LoginApi>(_onLoginApi);
  }

  _onEmailchanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copywith(email: event.email));
  }

  _onPasswordchanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copywith(password: event.password));
  }

  _onLoginApi(LoginApi event, Emitter<LoginState> emit) async {
    //  Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
    Map data = {"email": state.email, "password": state.password};

    emit(state.copywith(postAPIstatus: PostAPIstatus.loading));

    await loginRepository.loginApi(jsonEncode(data)).then((value) async {
      if (value.error.isNotEmpty) {
        print(value.error.toString());
        emit(state.copywith(
            message: value.error.toString(),
            postAPIstatus: PostAPIstatus.error));
      } else {
        await SessionController().SaveUserinPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copywith(
            message: "Login successfull  ${value.token}",
            postAPIstatus: PostAPIstatus.success));
        print(value.token);
      }
    }).onError((error, trackTrase) {
      print(error.toString());
      emit(state.copywith(
          message: error.toString(), postAPIstatus: PostAPIstatus.error));
    });
  }
}
