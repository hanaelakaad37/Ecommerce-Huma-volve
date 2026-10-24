import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error_handling/error_handling.dart';
import '../entities/sign_up_entity.dart';
import '../entities/sign_up_request_entity.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future <Either<ErrorHandling,SignUpEntity>>call(SignUpRequestEntity signupRequestModel){
    return _authRepository.signUp(signupRequestModel);
  }

}