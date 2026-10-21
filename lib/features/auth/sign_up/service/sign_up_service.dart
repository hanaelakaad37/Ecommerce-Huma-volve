import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/core/network/end_points.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/model/SignUpModel.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/model/signup_request_model.dart';

class SignUpService {
  ApiClient _apiClient;
  SignUpService(this._apiClient);

  Future<SignUpModel>signUp(SignupRequestModel signupRequestModel)async{
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