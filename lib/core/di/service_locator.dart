import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/core/db/db_service.dart';
import 'package:news_app_clean_architecture/core/network/network_client.dart';
import 'package:news_app_clean_architecture/core/shared/contants.dart';
import 'package:news_app_clean_architecture/features/home/data/api/home_api.dart';
import 'package:news_app_clean_architecture/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app_clean_architecture/features/home/domain/repository/home_repository.dart';
import 'package:news_app_clean_architecture/features/home/domain/usecase/home_usecase.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';
import 'package:news_app_clean_architecture/features/result/data/api/result_api.dart';
import 'package:news_app_clean_architecture/features/result/data/repository/result_repository_impl.dart';
import 'package:news_app_clean_architecture/features/result/domain/usecase/result_usecase.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerSingleton<DbService>(DbService());
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
    () => NetworkClient(Dio(), constant: serviceLocator()).dio,
  );

  // Home
  serviceLocator.registerFactory<HomeBloc>(() => HomeBloc());
  serviceLocator.registerLazySingleton<HomeApi>(() => HomeApi(dio: serviceLocator()));
  serviceLocator
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(newsApi: serviceLocator(), apiKey: serviceLocator<Constant>().apiKey));
  serviceLocator.registerLazySingleton<HomeUseCase>(() => HomeUseCase(serviceLocator()));

  // Result
  serviceLocator.registerLazySingleton<ResultApi>(() => ResultApi(dio: serviceLocator()));
  serviceLocator
      .registerLazySingleton<ResultRepositoryImpl>(() => ResultRepositoryImpl(newsApi: serviceLocator(), apiKey: serviceLocator<Constant>().apiKey));
  serviceLocator.registerLazySingleton<ResultUseCase>(() => ResultUseCase(serviceLocator()));
  serviceLocator.registerFactory<ResultBloc>(() => ResultBloc());


}
