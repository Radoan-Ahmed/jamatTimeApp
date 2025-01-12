import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/location_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/usecase/location_dropdown_usecase.dart';

part 'location_dropdown_cubit.freezed.dart';
part 'location_dropdown_state.dart';

class LocationDropdownCubit extends Cubit<LocationDropdownState> {
  final LocationDropdownUsecase usecase;

  LocationDropdownCubit({required this.usecase}) : super(const LocationDropdownState.initial());

  Future<void> requestLocationDropdown(LocationDropdownRequestModel locationDropdownRequestModel) async {
    log("enter initial cubit");
    emit(const LocationDropdownState.initial());

    try {
      log("enter try block");
      final response = await usecase(locationDropdownRequestModel);
      log("the response is $response");
      emit(LocationDropdownState.success(model: response));
    } catch (e, s) {
      log("enter catch block");
      log("$e");
      log("$s");
      emit(LocationDropdownState.failed(
        exception: e,
        stackTrace: s,
      ));
    }
  }
}
