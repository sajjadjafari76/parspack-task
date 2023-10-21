import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';

abstract class HomeRepository {
  Future<List<HomeEntity>> getRecentNews();
}
