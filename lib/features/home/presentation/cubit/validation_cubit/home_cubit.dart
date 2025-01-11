import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeEmail(String email){
   emit(state.copyWith(email: email));
  }

  void changePassword(String password){
   emit(state.copyWith(password: password));
  }

  void changeMosqueDropdownList(List<Datum> data){
    emit(state.copyWith(data: data));
  }

}
