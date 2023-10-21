part of 'main_home_bloc.dart';

abstract class MainHomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainNewsInitialState extends MainHomeState {}

class MainNewsLoadingState extends MainHomeState {}

class MainNewsGetRecentNewsSuccessState extends MainHomeState {
  final List<HomeEntity> news;
  MainNewsGetRecentNewsSuccessState(this.news);

  @override
  List<Object> get props => [news];
}

class MainNewsErrorState extends MainHomeState {
  final String message;
  MainNewsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
