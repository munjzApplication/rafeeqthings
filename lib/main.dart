import 'package:bloc_operations/controller/Counter_bloc/counter_bloc.dart';
import 'package:bloc_operations/controller/Post_bloc/post_bloc.dart';
import 'package:bloc_operations/controller/favorites_bloc/favorites_bloc.dart';
import 'package:bloc_operations/controller/image_picker/image_picker_bloc.dart';
import 'package:bloc_operations/controller/switch_slider_bloc/switch_and_slider_bloc.dart';
import 'package:bloc_operations/controller/todo_bloc/todo_bloc.dart';
import 'package:bloc_operations/repository/auth/login_http_api_repository.dart';
import 'package:bloc_operations/repository/auth/login_repository.dart';
import 'package:bloc_operations/repository/favorite_repository.dart';
// import 'package:bloc_operations/untils/image_picker/image_picker.dart';
// import 'package:bloc_operations/view/homeScreen.dart';
import 'package:bloc_operations/view/splash_screen/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => CounterBloc(),
        // ),
        BlocProvider(
          create: (context) => SwitchAndSliderBloc(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       ImagePickerBloc(imagePickerUntils: ImagePickerUntils()),
        // ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) =>
              FavoritesBloc(favoriteRepository: FavoriteRepository()),
        ),
        // BlocProvider(
        //   create: (context) => PostBloc(),
        // )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: false,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpAPIRepository());
}
