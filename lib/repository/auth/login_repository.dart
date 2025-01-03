import 'package:bloc_operations/config/routes/app_urls.dart';
import 'package:bloc_operations/data/network/network_api_services.dart';
import 'package:bloc_operations/model/personalModel/personal_model.dart';

class LoginRepository {

  final _api =NetworkApiServices();

  Future<Personalmodel> LoginApi (dynamic data)async{
    
    final response = await _api.postApi(AppUrls.loginAPI, data);

    return Personalmodel.fromJson(response);
  }
  }
  
