// import 'package:bloc_operations/view/homeScreen.dart';
import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:bloc_operations/main.dart';
import 'package:bloc_operations/view/Authentication/login_screen/widgets/email_input_widget.dart';
import 'package:bloc_operations/view/Authentication/login_screen/widgets/login_button.dart';
import 'package:bloc_operations/view/Authentication/login_screen/widgets/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenRegistration extends StatefulWidget {
  const ScreenRegistration({super.key});

  @override
  State<ScreenRegistration> createState() => _ScreenRegistrationState();
}

class _ScreenRegistrationState extends State<ScreenRegistration> {
  late LoginBloc loginBloc;

  final emailNode = FocusNode();
  final passwordlNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc(loginRepository: getIt());
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
