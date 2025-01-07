import 'package:bloc_operations/services/splash/spalsh_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  SpalshServices spalshServices = SpalshServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spalshServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text("splash Screen"),
                SizedBox(
                  height: 100,
                ),
                CupertinoActivityIndicator()
              ],
            ),
          )
        ],
      )),
    );
  }
}
