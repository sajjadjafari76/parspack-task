

import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/features/result/data/api/result_api.dart';
import 'package:news_app_clean_architecture/features/result/domain/repository/result_repository.dart';

class ResultRepositoryImpl implements ResultRepository {
  final ResultApi newsApi;
  final String apiKey;

  ResultRepositoryImpl({
    required this.newsApi,
    required this.apiKey,
  });

  @override
  Future<List<PersonModel>> getInfo() {
    return newsApi.getInfo();
  }
}
