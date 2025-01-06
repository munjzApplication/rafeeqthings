import 'package:bloc_operations/config/routes/app_urls.dart';
import 'package:bloc_operations/data/network/network_api_services.dart';
import 'package:bloc_operations/model/personalModel/personal_model.dart';
import 'package:bloc_operations/repository/auth/login_repository.dart';

class LoginHttpAPIRepository implements LoginRepository {

  final _api =NetworkApiServices();

@override
  Future<Personalmodel> loginApi (dynamic data)async{
    
    final response = await _api.postApi(AppUrls.loginAPI, data);

    return Personalmodel.fromJson(response);
  }
  }
  
