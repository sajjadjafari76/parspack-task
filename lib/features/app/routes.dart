import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/main_news_screen/main_home_screen.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/main_news_screen/result_home_screen.dart';

import 'app.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter route(){
    return GoRouter(
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return NoTransitionPage(
                child: ScaffoldWithNavBar(
                  location: state.location,
                  child: child,
                ));
          },
          routes: [
            GoRoute(
              path: '/home',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return   NoTransitionPage(
                  child: BlocProvider.value(
                    value: serviceLocator<HomeBloc>(),
                    child: const MainHomeScreen(),
                  ),
                );
              },
            ),
            GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: '/result',
                pageBuilder: (context, state) {
                  return   NoTransitionPage(
                    child: BlocProvider.value(
                      value: serviceLocator<ResultBloc>()..add(ResultGetRecentNewsEvent()),
                      child: const ResultHomeScreen(),
                    ),
                  );
                }, ),
          ],
        ),
      ],
    );
  }
}
