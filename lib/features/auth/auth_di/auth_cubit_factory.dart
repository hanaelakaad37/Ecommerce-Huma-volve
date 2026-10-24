import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/reposiatory_imp/repository_imp.dart';

import '../data/data_Source/auth_data_source_imp.dart';
import '../domain/use_case/login_use_case.dart';
import '../domain/use_case/sign_up_use_case.dart';
import '../presentation/view_model/auth_cubit.dart';

class AuthCubitFactory {
  static AuthCubit create() {
    final apiClient = ApiClient();

    final dataSource = AuthDataSourceImp(apiClient);
    final repository = RepositoryImp(dataSource);

    final loginUseCase = LoginUseCase(repository);
    final signUpUseCase = SignUpUseCase(repository);

    return AuthCubit(
      loginUseCase: loginUseCase,
      signUpUseCase: signUpUseCase,
    );
  }
}