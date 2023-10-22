part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {


  @override
  List<Object?> get props => [];
}

// class MainHomeGetRecentNewsEvent extends HomeEvent {

  // saveOnDB() {
  //
  //   var gg = 'sdfgdsg';
  //   var gfg =gg;
  //
  // }

// }


final class LoginNameChanged extends HomeEvent {
  LoginNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class LoginFamilyChanged extends HomeEvent {
  LoginFamilyChanged(this.family);

  final String family;

  @override
  List<Object> get props => [family];
}

final class LoginMobileChanged extends HomeEvent {
  LoginMobileChanged(this.mobile);

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

final class BtnSubmitted extends HomeEvent {
  BtnSubmitted();
}