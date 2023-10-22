
import 'package:news_app_clean_architecture/core/db/person_model.dart';

abstract class HomeRepository {
    Future<bool> saveInfo(PersonModel person);
}
