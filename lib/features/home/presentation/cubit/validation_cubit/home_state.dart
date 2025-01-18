
part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {

  const factory HomeState({
    String? mosque,
    String? location,
    List<Datum>? mosqueData,
    List<Datum>? locationData,
    List<Rows>? jamatTimeData,
  }) = _HomeState;
}

