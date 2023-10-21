import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/domain/usecase/get_recent_home_usecase.dart';

part 'main_home_event.dart';
part 'main_home_state.dart';

class MainHomeBloc extends Bloc<MainHomeEvent, MainHomeState> {
  MainHomeBloc() : super(MainNewsInitialState()) {
    on<MainNewsGetRecentNewsEvent>(mainNewsGetRecentNewsEvent);
  }

  FutureOr<void> mainNewsGetRecentNewsEvent(
      MainNewsGetRecentNewsEvent event, Emitter<MainHomeState> emit) async {
    try {
      emit(MainNewsLoadingState());
      List<HomeEntity> news =
          await serviceLocator<GetRecentHomeUseCase>().call();
      emit(MainNewsGetRecentNewsSuccessState(news));
    } catch (e) {
      emit(MainNewsErrorState("Something Went Wrong"));
    }
  }
}
