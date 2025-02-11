import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/core/db/db_service.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';

class HomeApi {
  final Dio dio;

  HomeApi({required this.dio});

  Future<bool> saveOnDb(PersonModel model) async {
    try {
      serviceLocator<DbService>().add(model);
      return true;
    } catch (e) {
      return false;
    }
  }
}
