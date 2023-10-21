import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';

class DbService {
  final Box<PersonModel> _personBox = Hive.box('person_box');

  List<PersonModel> getAll() {
    return _personBox.values.toList();
  }

  Future<void> add(PersonModel personModel) async {
    await _personBox.add(personModel);
  }

  Future<void> update(int index, PersonModel personModel) async {
    await _personBox.put(index, personModel);
  }

  Future<void> delete(String taskId) async {
    await _personBox.delete(taskId);
  }
}
