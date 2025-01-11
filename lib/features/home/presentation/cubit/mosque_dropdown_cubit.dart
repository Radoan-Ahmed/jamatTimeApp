import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/request_model/mosque_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/usecase/mosque_dropdown_usecase.dart';

part 'mosque_dropdown_cubit.freezed.dart';
part 'mosque_dropdown_state.dart';

class MosqueDropdownCubit extends Cubit<MosqueDropdownState> {
  final MosqueDropdownUsecase usecase;

  MosqueDropdownCubit({required this.usecase}) : super(const MosqueDropdownState.initial());

  Future<void> requestMosqueDropdown() async {
    log("enter initial cubit");
    emit(const MosqueDropdownState.initial());

    try {
      log("enter try block");
      final response = await usecase(MosqueDropdownRequestModel());
      log("the response is $response");
      emit(MosqueDropdownState.success(model: response));
    } catch (e, s) {
      log("enter catch block");
      log("$e");
      log("$s");
      emit(MosqueDropdownState.failed(
        exception: e,
        stackTrace: s,
      ));
    }
  }
}
