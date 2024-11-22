import 'package:bloc_operations/view/counter_App/screen_counter.dart';
import 'package:bloc_operations/view/favourites_App/favourites_home.dart';
import 'package:bloc_operations/view/screen_capture/screen_capture.dart';
import 'package:bloc_operations/view/slider_notification/screen_slider_notification.dart';
import 'package:bloc_operations/view/todo_App/todoApp.dart';

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myHomeButton(
                text: "Counter App",
                context: context,
                screenName: const MyCounter()),
            myHomeButton(
                text: "Slider And Switch App",
                context: context,
                screenName: const MySliderAndSwitch()),
            myHomeButton(
                text: "Image picker App",
                context: context,
                screenName: const ScreenCapture()),
            myHomeButton(
                text: "ToDo App",
                context: context,
                screenName: const MyTODOApp()),
            myHomeButton(
                text: "Favourites App",
                context: context,
                screenName: const ScreenFavouritesHome())
          ],
        ),
      ),
    );
  }
}

ElevatedButton myHomeButton(
        {required String text,
        required Widget screenName,
        required BuildContext context}) =>
    ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screenName));
        },
        child: Text(text));
