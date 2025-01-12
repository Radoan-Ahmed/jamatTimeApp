import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeMosque(String mosque){
   emit(state.copyWith(mosque: mosque));
  }

  void changeLocation(String location){
   emit(state.copyWith(location: location));
  }

  void changeMosqueDropdownList(List<Datum> data){
    emit(state.copyWith(data: data));
  }

}
