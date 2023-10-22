
import 'package:news_app_clean_architecture/core/db/person_model.dart';

abstract class ResultRepository {
    Future<List<PersonModel>> getInfo();
}
