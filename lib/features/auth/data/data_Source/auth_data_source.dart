import '../model/LoginModel.dart';
import '../model/SignUpModel.dart';
import '../model/signup_request_model.dart';

abstract  class AuthDataSource {
Future<LoginModel> login ({required String email , required String password});
Future<SignUpModel>signUp(SignupRequestModel signupRequestModel);


}