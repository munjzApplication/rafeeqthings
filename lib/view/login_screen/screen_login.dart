// import 'package:bloc_operations/view/homeScreen.dart';
import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  late LoginBloc loginBloc;

  final emailNode = FocusNode();
  final passwordlNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocProvider(
              create: (context) => loginBloc,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const Text("Login Screen"),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            EmailInputWidget(emailNode: emailNode),
                            const SizedBox(
                              height: 10,
                            ),
                            PasswordInputWidget(passwordlNode: passwordlNode),
                            const SizedBox(
                              height: 50,
                            ),
                            MyLoginButton(formKey: _formKey)
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
