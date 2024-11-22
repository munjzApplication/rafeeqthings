import 'package:bloc_operations/controller/Counter_bloc/counter_bloc.dart';
import 'package:bloc_operations/controller/favorites_bloc/favorites_bloc.dart';
import 'package:bloc_operations/controller/image_picker/image_picker_bloc.dart';
import 'package:bloc_operations/controller/switch_slider_bloc/switch_and_slider_bloc.dart';
import 'package:bloc_operations/controller/todo_bloc/todo_bloc.dart';
import 'package:bloc_operations/repository/favorite_repository.dart';
import 'package:bloc_operations/untils/image_picker/image_picker.dart';
import 'package:bloc_operations/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchAndSliderBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ImagePickerBloc(imagePickerUntils: ImagePickerUntils()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) =>
              FavoritesBloc(favoriteRepository: FavoriteRepository()),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         // useMaterial3: false,
        ),
        home: const MyHome(),
      ),
    );
  }
}
