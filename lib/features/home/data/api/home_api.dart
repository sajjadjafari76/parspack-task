import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';

class HomeApi {
  final Dio dio;
  final String apiKey;
  HomeApi({required this.dio, required this.apiKey});
  Future<List<HomeEntity>> getRecentNews() async {
    final res = await dio
        .get('/v2/everything?q=singapore&sortBy=publishedAt&apiKey=$apiKey');
    return List<Map<String, dynamic>>.from(res.data['articles'])
        .map((e) => HomeEntity.fromJson(e))
        .toList();
  }
}
