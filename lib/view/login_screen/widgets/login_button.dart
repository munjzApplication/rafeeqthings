import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:bloc_operations/model/personalModel/personal_model.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const MyLoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postAPIstatus != current.postAPIstatus,
      listener: (context, state) {
        if (state.postAPIstatus == PostAPIstatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
        if (state.postAPIstatus == PostAPIstatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
        if (state.postAPIstatus == PostAPIstatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text("API uploading")));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postAPIstatus != current.postAPIstatus,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(const LoginApi());
                }
              },
              child: state.postAPIstatus == PostAPIstatus.loading
                  ? const CupertinoActivityIndicator()
                  : const Text("Login"));
        },
      ),
    );
  }
}
