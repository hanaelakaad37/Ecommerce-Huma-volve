import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error_handling/error_handling.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/data_Source/auth_data_source.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_request_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repository/auth_repository.dart';

import '../model/signup_request_model.dart';


class RepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  RepositoryImp(this._authDataSource);

  @override
  Future<Either<ErrorHandling, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authDataSource.login(
        email: email,
        password: password,
      );

      return right(result);
    } catch (e) {
      return left(ErrorHandling.handle(e) as ErrorHandling);
    }
  }

  @override
  Future<Either<ErrorHandling, SignUpEntity>> signUp(
      SignUpRequestEntity signupRequestModel,
      ) async {
    try {
      final requestModel = SignupRequestModel(
        email: signupRequestModel.email,
        password: signupRequestModel.password,
        name: signupRequestModel.name,
        avatar: signupRequestModel.avatar,
      );

      final result = await _authDataSource.signUp(requestModel);

      return right(result);
    } catch (e) {
      return left(ErrorHandling.handle(e) as ErrorHandling);
    }
  }
}
