import 'package:awesome_app/core/enum/condition_state_enum.dart';
import 'package:awesome_app/features/home/domain/usecases/home_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/depedency_injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/triger_snackbar_error.dart';
import '../../../../core/widget/snackbar_custom.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeGetPhotosEvent>(homeGetPhotos);
  }

  Future homeGetPhotos(
      HomeGetPhotosEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(conditionStateEnum: ConditionStateEnum.loading));

    final response =
        await locator<HomeUsecase>().getPhotos(perPage: 2, page: 1);

    response.fold(
      (error) {
        TrigerError().trigerSnackbarError(
            context: event.context, error: error, title: 'Failed Get Photos');
        if (error is ConnectionFailure) {
          emit(state.copyWith(
            conditionStateEnum: ConditionStateEnum.error,
            errorMessage: error.message,
          ));
        } else if (error is ServerFailure) {
          emit(state.copyWith(
            conditionStateEnum: ConditionStateEnum.error,
            errorMessage: error.message,
          ));
        } else if (error is GeneralFailure) {
          emit(state.copyWith(
            conditionStateEnum: ConditionStateEnum.error,
            errorMessage: error.message,
          ));
        } else {
          emit(state.copyWith(
            conditionStateEnum: ConditionStateEnum.error,
            errorMessage: 'Failed Get Photos',
          ));
          SnackbarCustom(context: event.context)
              .error(title: 'Failed Get Photos', desc: error.toString());
        }
      },
      (data) {
        print('RESULT DATA PHOTOS: ${data.toJson()}');
        emit(state.copyWith(
          conditionStateEnum: ConditionStateEnum.success,
          // valueListMyAnnouncement: data,
        ));
      },
    );
  }
}
