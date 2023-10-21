import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/core/db/db_service.dart';
import 'package:news_app_clean_architecture/core/network/network_client.dart';
import 'package:news_app_clean_architecture/core/shared/contants.dart';
import 'package:news_app_clean_architecture/features/home/data/api/home_api.dart';
import 'package:news_app_clean_architecture/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app_clean_architecture/features/home/domain/repository/home_repository.dart';
import 'package:news_app_clean_architecture/features/home/domain/usecase/get_recent_home_usecase.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/main_home_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
    () => NetworkClient(Dio(), constant: serviceLocator()).dio,
  );

  // News
  serviceLocator.registerFactory<MainHomeBloc>(() => MainHomeBloc());
  serviceLocator.registerLazySingleton<HomeApi>(() => HomeApi(
      dio: serviceLocator(), apiKey: serviceLocator<Constant>().apiKey));
  serviceLocator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
      newsApi: serviceLocator(), apiKey: serviceLocator<Constant>().apiKey));
  serviceLocator.registerLazySingleton<GetRecentHomeUseCase>(
      () => GetRecentHomeUseCase(serviceLocator()));

  serviceLocator.registerSingleton<DbService>(DbService());
}
