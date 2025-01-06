part of 'login_bloc.dart';

// @freezed
// class LoginState with _$LoginState {
//   const factory LoginState.initial() = _Initial;
// }

class LoginState extends Equatable {
  const LoginState(
      {this.email = "",
      this.password = "",
      this.message = "",
      this.postAPIstatus = PostAPIstatus.initial});

  final String email;
  final String password;
  final String message;

   final PostAPIstatus postAPIstatus;

  LoginState copywith(
      {String? email,
      String? password,
      PostAPIstatus? postAPIstatus,
      String? message}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        postAPIstatus: postAPIstatus ?? this.postAPIstatus,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [email, password, postAPIstatus, message];
}
