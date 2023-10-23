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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MainHomeScreen(),
    const ResultHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _widgetOptions.elementAt(pageIndex),
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
    );
  }
}
