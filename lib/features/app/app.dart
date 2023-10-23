import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/core/shared/color_constant.dart';
import 'package:news_app_clean_architecture/features/app/routes.dart';
import 'package:news_app_clean_architecture/features/app/themes.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/main_news_screen/main_home_screen.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/main_news_screen/result_home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.child});

  final Widget child;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      // routerConfig: AppRouter().generateRoute(),
      home: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: pageIndex,
            children: [
              // GoRouter.of(context).go('/home'),
              BlocProvider.value(
                value: serviceLocator<ResultBloc>()..add(ResultGetRecentNewsEvent()),
                child: const ResultHomeScreen(),
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: pageIndex,
          destinations: const [
            // the appearance of each tab is defined with a [NavigationDestination] widget
            NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
            NavigationDestination(label: 'Result', icon: Icon(Icons.settings)),
          ],
          onDestinationSelected: (index) {
            pageIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
