import 'package:books/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:books/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books/Features/home/data/repos/home_repo_impl.dart';
import 'package:books/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRepoDataSource: HomeRepoDataSourceImp(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
