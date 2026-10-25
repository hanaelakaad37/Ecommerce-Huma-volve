import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repository/auth_repository.dart';

import '../entities/login_entity.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) {
    return _authRepository.login(email: email, password: password);
  }
}
