import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/sign_up_request_entity.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/sign_up_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
  }) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final result = await loginUseCase.call(
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          emit(LoginError(failure.errorMessage));
        },
        (loginEntity) {
          emit(LoginSuccess(loginEntity));
        },
      );
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> signUp(SignUpRequestEntity request) async {
    emit(SignUpLoading());

    try {
      final result = await signUpUseCase.call(request);

      result.fold(
        (failure) {
          emit(SignUpError(failure.errorMessage));
        },
        (signUpEntity) {
          emit(SignUpSuccess(signUpEntity));
        },
      );
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
