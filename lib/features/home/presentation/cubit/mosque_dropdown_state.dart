part of 'mosque_dropdown_cubit.dart';

@freezed
class MosqueDropdownState with _$MosqueDropdownState {
  const factory MosqueDropdownState.initial() = _Initial;

  const factory MosqueDropdownState.loading() = _Loading;

  const factory MosqueDropdownState.success({
    required MosqueDropdownResponseModel model,
  }) = _Success;

  const factory MosqueDropdownState.failed({
    required Object exception,
    required StackTrace stackTrace,
  }) = _Failed;

}
