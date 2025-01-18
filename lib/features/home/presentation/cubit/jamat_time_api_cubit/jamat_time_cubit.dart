import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/request_model/jamat_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/jamat_time_response_model.dart';
import 'package:jamat_app/features/home/domain/usecase/jamat_time_usecase.dart';

part 'jamat_time_cubit.freezed.dart';
part 'jamat_time_state.dart';

class JamatTimeCubit extends Cubit<JamatTimeState> {
  final JamatTimeUsecase usecase;

  JamatTimeCubit({required this.usecase}) : super(const JamatTimeState.initial());

  Future<void> requestJamatTime(JamatTimeRequestModel jamatTimeRequestModel) async {
    log("enter initial cubit");
    emit(const JamatTimeState.initial());

    try {
      log("enter try block");
      final response = await usecase(jamatTimeRequestModel);
      log("the response is $response");
      emit(JamatTimeState.success(model: response));
    } catch (e, s) {
      log("enter catch block");
      log("$e");
      log("$s");
      emit(JamatTimeState.failed(
        exception: e,
        stackTrace: s,
      ));
    }
  }
}
