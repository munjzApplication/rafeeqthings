// import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_operations/repository/auth/login_repository.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
// part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
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

    await loginRepository.LoginApi(data).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copywith(
            message: value.error.toString(),
            postAPIstatus: PostAPIstatus.error));
      } else {
        emit(state.copywith(
            message: "Login successfull  ${value.token}",
            postAPIstatus: PostAPIstatus.success));
        print(value.token);
      }
    }).onError((error, trackTrase) {
      emit(state.copywith(
          message: error.toString(), postAPIstatus: PostAPIstatus.error));
    });
  }
}
