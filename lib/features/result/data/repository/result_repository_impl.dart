

import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/features/result/data/api/result_api.dart';
import 'package:news_app_clean_architecture/features/result/domain/repository/result_repository.dart';

class ResultRepositoryImpl implements ResultRepository {
  final ResultApi resultApi;

  ResultRepositoryImpl({
    required this.resultApi,
  });

  @override
  Future<List<PersonModel>> getInfo() {
    return resultApi.getInfo();
  }
}
