import 'dart:async';

import 'package:bloc_operations/services/session_manager/session_controller.dart';
import 'package:bloc_operations/view/HomeScreen.dart';
import 'package:bloc_operations/view/login_screen/screen_login.dart';
import 'package:flutter/cupertino.dart';

class SpalshServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLoged ?? false) {
        Timer(
            const Duration(seconds: 4),
            () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const MyHome(),
                )));
      } else {
        Timer(
            const Duration(seconds: 4),
            () => Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(builder: (context) => const ScreenLogin()),
                  (route) => false,
                ));
      }
    }).onError((error, stackTrace) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const ScreenLogin()),
                (route) => false,
              ));
    });
  }
}
