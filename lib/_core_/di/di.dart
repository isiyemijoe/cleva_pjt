import 'package:cleva_pjt/modules/users/data/datasource/users_data_source.dart';
import 'package:cleva_pjt/modules/users/data/repository/users_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

class DependencyInjection {
  static void injectDependencies() {
    Dio dio = Dio(BaseOptions());
    locator
      ..registerSingleton<Dio>(dio)
      ..registerSingleton<UsersApiDataSource>(UsersApiDataSource(locator<Dio>()))
      ..registerSingleton<UsersRepository>(UsersRepositoryImpl(locator<UsersApiDataSource>()));
  }
}
