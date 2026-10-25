import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repository/auth_repository.dart';

import '../entities/sign_up_entity.dart';
import '../entities/sign_up_request_entity.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future<Either<Failure, SignUpEntity>> call(SignUpRequestEntity request) {
    return _authRepository.signUp(request);
  }
}
