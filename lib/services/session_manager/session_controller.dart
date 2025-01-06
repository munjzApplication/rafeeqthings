import 'dart:convert';

import 'package:bloc_operations/model/personalModel/personal_model.dart';
import 'package:bloc_operations/model/userModel/userModel.dart';
import 'package:bloc_operations/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  Personalmodel user = Personalmodel();
  bool? isLoged;

  factory SessionController() {
    return _session;
  }

  SessionController._internal() {
    isLoged = false;
  }

  Future<void> SaveUserinPreference(dynamic personmodel) async {
    localStorage.setValue(key: "token", value: jsonEncode(personmodel));

    localStorage.setValue(key: "isLoged", value: "true");
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue(key: "token");
      var isLogedIn = await localStorage.readValue(key: "isLoged");

      if (userData.toString().isNotEmpty) {
        SessionController().user = Personalmodel.fromJson(jsonDecode(userData));
      }

      SessionController().isLoged = isLogedIn == "true" ? true : false;
    } catch (e) {
      print(e.toString());
    }
  }
}
