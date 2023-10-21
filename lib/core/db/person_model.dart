import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 0)
class PersonModel extends HiveObject {
  @HiveField(0)
  int? id = Hive.generateSecureKey() as int?;
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  int? age;

  PersonModel({required this.name, required this.phone, required this.age});
}
