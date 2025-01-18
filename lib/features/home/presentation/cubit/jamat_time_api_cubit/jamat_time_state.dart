part of 'jamat_time_cubit.dart';

@freezed
class JamatTimeState with _$JamatTimeState {
  const factory JamatTimeState.initial() = _Initial;

  const factory JamatTimeState.loading() = _Loading;

  const factory JamatTimeState.success({
    required JamatTimeResponseModel model,
  }) = _Success;

  const factory JamatTimeState.failed({
    required Object exception,
    required StackTrace stackTrace,
  }) = _Failed;

}
