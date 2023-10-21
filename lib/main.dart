import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/app/app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path) ;
  Hive.registerAdapter(PersonModelAdapter());
  await Hive.openBox<PersonModel>('person_box'); // Open the box with the correct type

  await setupServiceLocator();
  runApp(const MainApp());
}
