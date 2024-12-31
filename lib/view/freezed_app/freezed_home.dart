import 'package:bloc_operations/data/exception/app_exceptions.dart';
import 'package:bloc_operations/model/userModel/userModel.dart';
import 'package:bloc_operations/view/homeScreen.dart';
import 'package:flutter/material.dart';

class Homefreezed extends StatelessWidget {
  Homefreezed({super.key});

  List<UserModel> usersList = [
    UserModel(name: null),
    UserModel(name: "Shanu"),
    UserModel(name: "izzu"),
    UserModel(name: "dilu"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        throw NoInternetException("no internet connection");
        // Map<String, dynamic> data = {
        //   "name": "mohammed",
        // };

        // UserModel model = UserModel.fromJson(data);
        // print("valueeee : ${model.name}");
        // model = model.copyWith(name: "new value");
        // print("valueeeewwwww : ${model.name}");
      }),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(usersList[index].name.toString()),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: usersList.length),
    );
  }
}
