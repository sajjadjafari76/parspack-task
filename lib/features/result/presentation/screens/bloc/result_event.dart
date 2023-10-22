part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainHomeGetRecentNewsEvent extends ResultEvent {}
