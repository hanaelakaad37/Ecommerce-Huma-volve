import 'package:ecommerce_app_huma_volve/features/auth/data/data_Source/auth_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/model/LoginModel.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/model/SignUpModel.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/model/signup_request_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/end_points.dart';

class AuthDataSourceImp implements AuthDataSource{
  final ApiClient _apiClient;
  AuthDataSourceImp(this._apiClient);
  @override
  Future<LoginModel> login({required String email, required String password})async {
    final response= await _apiClient.dio.post(
        EndPoints.login,
        data: {
          'email' :email,
          'password':password
        });

    final data = response.data;
    final loginDataModel = LoginModel.fromJson(data);
    return loginDataModel;
  }

  @override
  Future<SignUpModel> signUp(SignupRequestModel signupRequestModel)async {
    final response = await _apiClient.dio.post(
        EndPoints.signup,
        data: {
          'name': signupRequestModel.name,
          'email' :signupRequestModel.email,
          'password':signupRequestModel.password,
          'role' :"customer",
          'avatar' :"https://i.pravatar.cc/150?img=48",
        }
    );
    final signupJsonData =response.data;
    final signupDataModel =SignUpModel.fromJson(signupJsonData);
    return signupDataModel;
  }



}