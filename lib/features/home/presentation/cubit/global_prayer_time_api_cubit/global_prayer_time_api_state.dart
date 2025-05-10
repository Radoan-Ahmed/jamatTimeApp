part of 'global_prayer_time_api_cubit.dart';

@freezed
class GlobalPrayerTimeApiState with _$GlobalPrayerTimeApiState {
  const factory GlobalPrayerTimeApiState.initial() = _Initial;

  const factory GlobalPrayerTimeApiState.loading() = _Loading;

  const factory GlobalPrayerTimeApiState.success({
    required GlobalPrayerTimeResponseModel model,
  }) = _Success;

  const factory GlobalPrayerTimeApiState.failed({
    required Object exception,
    required StackTrace stackTrace,
  }) = _Failed;

}
