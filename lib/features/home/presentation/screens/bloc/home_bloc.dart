import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/core/shared/validation.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/domain/usecase/home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class ResultBloc extends Bloc<HomeEvent, HomeState> {
  ResultBloc() : super(const HomeState()) {
    // on<MainHomeGetRecentNewsEvent>(saveOnDB);
    on<LoginNameChanged>(_onNameChanged);
    on<LoginFamilyChanged>(_onFamilyChanged);
    on<LoginMobileChanged>(_onMobileChanged);
    on<BtnSubmitted>(_onSubmitted);
  }

  void _onNameChanged(
    LoginNameChanged event,
    Emitter<HomeState> emit,
  ) {
    final name = Name.dirty(event.name);
    final nameq = state.name.value;
    emit(state.copyWith(name: name, isValid: true //Formz.validate([state.name, name]),
        ));
  }

  void _onFamilyChanged(
    LoginFamilyChanged event,
    Emitter<HomeState> emit,
  ) {
    final family = Family.dirty(event.family);
    emit(state.copyWith(family: family, isValid: true //Formz.validate([family, state.family]),
        ));
  }

  void _onMobileChanged(
    LoginMobileChanged event,
    Emitter<HomeState> emit,
  ) {
    final mobile = Mobile.dirty(event.mobile);
    emit(state.copyWith(mobile: mobile, isValid: true //Formz.validate([mobile, state.family]),
        ));
  }

  Future<void> _onSubmitted(
    BtnSubmitted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      PersonModel model = PersonModel(
          name: state.name.value, family: state.family.value, phone: state.mobile.value, age: 0);
      bool res = await serviceLocator<HomeUseCase>().call(model);

      // await _authenticationRepository.logIn(
      //   username: state.username.value,
      //   password: state.password.value,
      // );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}

// FutureOr<void> saveOnDB(MainHomeGetRecentNewsEvent event, Emitter<HomeState> emit) async {
//   try {
//     emit(MainHomeLoadingState());
//     List<HomeEntity> news = await serviceLocator<GetRecentHomeUseCase>().call();
//     emit(MainHomeSuccessState(news));
//   } catch (e) {
//     emit(const MainHomeErrorState("Something Went Wrong"));
//   }
// }
