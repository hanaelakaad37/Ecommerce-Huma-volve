import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error_handling/error_handling.dart';
import '../entities/login_entity.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future <Either<ErrorHandling,LoginEntity>> call ({required String email , required String password}){
    return _authRepository.login(email: email, password: password);
  }

}