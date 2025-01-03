import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordlNode;
  const PasswordInputWidget({super.key, required this.passwordlNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        print("taped password");
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: passwordlNode,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          onFieldSubmitted: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return "enter passwor";
            }
            if (value.length < 5) {
              return "enter morethan 5 character";
            }
            return null;
          },
        );
      },
    );
  }
}
