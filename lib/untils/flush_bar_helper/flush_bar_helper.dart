import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void fleshbarErrorMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 3),
          message: message,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
            size: 28,
          ),
        )..show(context));
  }

  static void fleshbarWarningMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 3),
          message: message,
          backgroundColor: Colors.grey,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
            size: 28,
          ),
        )..show(context));
  }

  static void fleshbarSuccessMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 3),
          message: message,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.done,
            color: Colors.white,
            size: 28,
          ),
        )..show(context));
  }
}
