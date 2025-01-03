import 'package:bloc_operations/controller/login_bloc/login_bloc.dart';
import 'package:bloc_operations/untils/validation/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailNode;
  const EmailInputWidget({super.key, required this.emailNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        print("taped email");
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailNode,
          decoration: InputDecoration(
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          onFieldSubmitted: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return "enter email";
            }
            if (!FormFieldValidations.isValidEmail(value)) {
              return "enter valid email";
            }
            return null;
          },
        );
      },
    );
  }
}
