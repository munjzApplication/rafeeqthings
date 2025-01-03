import 'dart:async';

import 'package:bloc_operations/view/login_screen/screen_login.dart';
import 'package:flutter/cupertino.dart';

class SpalshServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => const ScreenLogin()),
              (route) => false,
            ));
  }
}
