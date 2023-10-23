import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/app/app.dart';
import 'package:path_provider/path_provider.dart';

import 'features/app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = "/assets/db";
  if (!kIsWeb) {
    var appDocDir = await getApplicationDocumentsDirectory();
    path = appDocDir.path;
  }
  Hive.init(path);
  Hive.registerAdapter(PersonModelAdapter());
  await Hive.openBox<PersonModel>('person_box'); // Open the box with the correct type

  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'parspack',
      routerConfig: AppRouter().route(),
    );
  }
}
