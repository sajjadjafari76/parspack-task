import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/main_news_screen/main_home_screen.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/main_news_screen/result_home_screen.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return BlocProvider.value(
              value: serviceLocator<HomeBloc>(),
              child: MainHomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/result',
          builder: (context, state) {
            return BlocProvider.value(
              value: serviceLocator<ResultBloc>()..add(ResultGetRecentNewsEvent()),
              child: const ResultHomeScreen(),
            );
          },
        ),
      ],
    );
  }
}
