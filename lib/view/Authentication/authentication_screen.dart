import 'package:bloc_operations/view/Authentication/login_screen/screen_login.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {

            }, child: const Text("Registration")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenLogin(),));
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
