
import 'dart:developer';

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

  void changeMosqueDropdownList(List<Datum> data){
    emit(state.copyWith(data: data));
  }

  void updatedPrayerState(Map<String, dynamic> times){
    log("cubit is calling");
    final now = DateTime.now();
    final parsedTime = parsedPrayerTime(times);
    String? upcommingPrayerName;
    DateTime? upcommingPrayerTime;
    for(var entry in parsedTime.entries){
      if(entry.value.isAfter(now)){
        upcommingPrayerName = entry.key;
        upcommingPrayerTime = entry.value;
        break;
      }
    }

    if (upcommingPrayerName == null) {
      final firstPrayer = parsedTime.entries.first;
      upcommingPrayerName = firstPrayer.key;
      upcommingPrayerTime = firstPrayer.value.add(Duration(days: 1));
    }

    emit(state.copyWith(
      nextPrayer: upcommingPrayerName,
      nextTime: upcommingPrayerTime.toString(),
      timeRemaining: upcommingPrayerTime!.difference(now),
    ));

  }

  Map<String,DateTime> parsedPrayerTime(Map<String, dynamic> times){
    final now = DateTime.now();
    final Map<String, DateTime> paresed = {};
    times.forEach((name, time)
    {
      final parts = time.split(" ");
      final timeParts = parts[0].split(":");
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);
      int second = int.parse(timeParts[2]);
      paresed[name] = DateTime(now.year, now.month, now.day, hour, minute, second);
    });
    return paresed;
  }

}
