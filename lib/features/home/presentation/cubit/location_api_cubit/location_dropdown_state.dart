part of 'location_dropdown_cubit.dart';

@freezed
class LocationDropdownState with _$LocationDropdownState {
  const factory LocationDropdownState.initial() = _Initial;

  const factory LocationDropdownState.loading() = _Loading;

  const factory LocationDropdownState.success({
    required LocationDropdownResponseModel model,
  }) = _Success;

  const factory LocationDropdownState.failed({
    required Object exception,
    required StackTrace stackTrace,
  }) = _Failed;

}
