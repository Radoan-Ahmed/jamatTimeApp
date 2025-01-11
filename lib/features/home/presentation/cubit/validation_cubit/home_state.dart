
part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {

  const factory HomeState({
    String? email,
    String? password,
    List<Datum>? data,
  }) = _HomeState;
}

