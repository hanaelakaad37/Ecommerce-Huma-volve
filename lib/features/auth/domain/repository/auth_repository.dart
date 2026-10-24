import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/entities/sign_up_request_entity.dart';

import '../../../../core/error_handling/error_handling.dart';

abstract class AuthRepository {
Future <Either<ErrorHandling,LoginEntity>> login ({required String email , required String password});
Future <Either<ErrorHandling,SignUpEntity>>signUp(SignUpRequestEntity signupRequestModel);



}