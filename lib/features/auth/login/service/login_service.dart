import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/core/network/end_points.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/model/LoginModel.dart';

class LoginService {
  final ApiClient _apiClient;
  LoginService(this._apiClient);

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.dio.post(
      EndPoints.login,
      data: {'email': email, 'password': password},
    );

    final data = response.data;
    final loginDataModel = LoginModel.fromJson(data);
    return loginDataModel;
  }
}
