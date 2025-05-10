import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/request_model/global_prayer_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/global_prayer_time_response_model.dart';
import 'package:jamat_app/features/home/domain/usecase/global_prayer_time_usecase.dart';

part 'global_prayer_time_api_cubit.freezed.dart';
part 'global_prayer_time_api_state.dart';

class GlobalPrayerTimeApiCubit extends Cubit<GlobalPrayerTimeApiState> {
  final GlobalPrayerTimeUsecase usecase;

  GlobalPrayerTimeApiCubit({required this.usecase})
      : super(const GlobalPrayerTimeApiState.initial());

  Future<void> requestGlobalPrayerTimeApi(String? location) async {
    log("enter initial cubit");
    emit(const GlobalPrayerTimeApiState.initial());

    try {
      log("enter try block");
      final response = await usecase(GlobalPrayerTimeRequestModel(
        location: location,
      ));
      log("the response is $response");
      emit(GlobalPrayerTimeApiState.success(model: response));
    } catch (e, s) {
      log("enter catch block");
      log("$e");
      log("$s");
      emit(GlobalPrayerTimeApiState.failed(
        exception: e,
        stackTrace: s,
      ));
    }
  }
}
