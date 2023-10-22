part of 'result_bloc.dart';

class ResultState extends Equatable {

  @override
  List<Object> get props => [];
}

// abstract class HomeState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

class ResultInitialState extends ResultState {}

class ResultLoadingState extends ResultState {}

class ResultSuccessState extends ResultState {
  final List<PersonModel> person;
  ResultSuccessState(this.person);

  @override
  List<Object> get props => [person];
}

class ResultErrorState extends ResultState {
  final String message;
  ResultErrorState(this.message);

  @override
  List<Object> get props => [message];
}
