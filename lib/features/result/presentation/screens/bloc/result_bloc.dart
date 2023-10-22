import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:news_app_clean_architecture/core/db/person_model.dart';
import 'package:news_app_clean_architecture/core/di/service_locator.dart';
import 'package:news_app_clean_architecture/core/shared/validation.dart';
import 'package:news_app_clean_architecture/features/result/domain/usecase/result_usecase.dart';

part 'result_event.dart';

part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultLoadingState()) {
    on<MainHomeGetRecentNewsEvent>(getDataFromDb);
  }

  FutureOr<void> getDataFromDb(MainHomeGetRecentNewsEvent event, Emitter<ResultState> emit) async {
    try {
      emit(ResultLoadingState());
      List<PersonModel> news = await serviceLocator<ResultUseCase>().call();
      emit(ResultSuccessState(news));
    } catch (e) {
      emit(ResultErrorState("Something Went Wrong"));
    }
  }
}
