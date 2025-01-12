
part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {

  const factory HomeState({
    String? mosque,
    String? location,
    List<Datum>? data,
  }) = _HomeState;
}

