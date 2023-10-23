

import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/features/result/domain/repository/result_repository.dart';

class ResultUseCase {
  final ResultRepository newsRepositoryImpl;
  ResultUseCase(this.newsRepositoryImpl);
  Future<List<PersonModel>> call() async {
    return newsRepositoryImpl.getInfo();
  }
}
