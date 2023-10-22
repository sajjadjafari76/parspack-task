
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository newsRepositoryImpl;
  HomeUseCase(this.newsRepositoryImpl);
  Future<bool> call(PersonModel person) async {
    return newsRepositoryImpl.saveInfo(person);
  }
}
