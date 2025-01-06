import 'package:bloc_operations/model/personalModel/personal_model.dart';
import 'package:bloc_operations/repository/auth/login_repository.dart';

class LoginMockAPIRepository implements LoginRepository {

  @override

  Future<Personalmodel> loginApi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {"token": "DummyQpwL5tke4Pnpja7X4", "error": ""};

    return Personalmodel.fromJson(response);
  }
}
