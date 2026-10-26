import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/data_source/details_data_source_imp.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/repository_imp/details_repository_imp.dart';
import 'package:ecommerce_app_huma_volve/features/details/domain/use_case/get_product_details_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/details/presentation/view_model/cubit/details_cubit.dart';

class DetailsCubitFactory {
  static DetailsCubit create() {
    final apiClient = ApiClient();
    final dataSource = DetailsDataSourceImp(apiClient);
    final repository = DetailsRepositoryImp(dataSource);
    final useCase = GetProductDetailsUseCase(repository);

    return DetailsCubit(getProductDetailsUseCase: useCase);
  }
}
