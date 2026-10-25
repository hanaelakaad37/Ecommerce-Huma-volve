import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_request_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, SignUpEntity>> signUp(
    SignUpRequestEntity signupRequestModel,
  );
}
