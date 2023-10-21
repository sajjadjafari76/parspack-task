import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/domain/repository/home_repository.dart';

class GetRecentHomeUseCase {
  final HomeRepository newsRepositoryImpl;
  GetRecentHomeUseCase(this.newsRepositoryImpl);
  Future<List<HomeEntity>> call() async {
    return newsRepositoryImpl.getRecentNews();
  }
}
