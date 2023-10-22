import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/core/db/db_service.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';

class ResultApi {
  final Dio dio;

  ResultApi({required this.dio});

  Future<List<PersonModel>> getInfo() async {
    try {
      return serviceLocator<DbService>().getAll();
    } catch (e) {
      return [];
    }
  }
}
