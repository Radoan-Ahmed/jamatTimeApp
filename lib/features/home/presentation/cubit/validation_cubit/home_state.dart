
part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {

  const factory HomeState({
    String? email,
    String? password,
    List<Datum>? data,
    Map<String, DateTime>? paresed,
    String? nextPrayer,
    String? nextTime,
    Duration? timeRemaining,
  }) = _HomeState;
}

