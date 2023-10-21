import 'package:news_app_clean_architecture/features/home/data/api/home_api.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi newsApi;
  final String apiKey;
  HomeRepositoryImpl({
    required this.newsApi,
    required this.apiKey,
  });

  @override
  Future<List<HomeEntity>> getRecentNews() {
    return newsApi.getRecentNews();
  }
}
