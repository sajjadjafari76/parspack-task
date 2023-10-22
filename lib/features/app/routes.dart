import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/main_news_screen/main_home_screen.dart';

class AppRouter {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocProvider.value(
            value: serviceLocator<ResultBloc>(),
            child:  MainHomeScreen(),
          );
        },
      )
    ]);
  }
}
