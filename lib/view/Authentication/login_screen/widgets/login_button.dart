import 'dart:async';

import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:bloc_operations/model/personalModel/personal_model.dart';
import 'package:bloc_operations/untils/enum/post_Enum.dart';
import 'package:bloc_operations/untils/flush_bar_helper/flush_bar_helper.dart';
import 'package:bloc_operations/view/HomeScreen.dart';
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
          FlushBarHelper.fleshbarErrorMessage(context, state.message);
        }

        if (state.postAPIstatus == PostAPIstatus.success) {
          FlushBarHelper.fleshbarSuccessMessage(context, "Login SuccessFull");
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const MyHome(),
              ));
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
                  // ignore: unrelated_type_equality_checks
                }
              },
              child: state.postAPIstatus == PostAPIstatus.loading
                  ? const CupertinoActivityIndicator()
                  : state.postAPIstatus == PostAPIstatus.success
                      ? const Icon(
                          Icons.done_outlined,
                          color: Colors.green,
                        )
                      : const Text("Login"));
        },
      ),
    );
  }
}
