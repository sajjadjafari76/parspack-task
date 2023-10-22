part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const Name.pure(),
    this.family = const Family.pure(),
    this.mobile = const Mobile.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Name name;
  final Family family;
  final Mobile mobile;
  final bool isValid;

  HomeState copyWith({
    FormzSubmissionStatus? status,
    Name? name,
    Family? family,
    Mobile? mobile,
    bool? isValid,
  }) {
    return HomeState(
      status: status ?? this.status,
      name: name ?? this.name,
      family: family ?? this.family,
      mobile: mobile ?? this.mobile,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, name, family];
}

// abstract class HomeState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

class MainHomeInitialState extends HomeState {}

class MainHomeLoadingState extends HomeState {}

class MainHomeSuccessState extends HomeState {
  // final List<HomeEntity> news;
  const MainHomeSuccessState();

  @override
  List<Object> get props => [];
}

class MainHomeErrorState extends HomeState {
  final String message;
  const MainHomeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
