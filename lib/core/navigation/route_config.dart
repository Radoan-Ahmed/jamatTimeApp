import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/dependency/dependency.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/home/domain/usecase/jamat_time_usecase.dart';
import 'package:jamat_app/features/home/domain/usecase/location_dropdown_usecase.dart';
import 'package:jamat_app/features/home/domain/usecase/mosque_dropdown_usecase.dart';
import 'package:jamat_app/features/home/presentation/cubit/jamat_time_api_cubit/jamat_time_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/location_api_cubit/location_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_api_cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';
import 'package:jamat_app/features/home/presentation/screen/home_screen.dart';

class RouteConfig{
  Route routes(RouteSettings settings){
    log("${settings.name}",name: "Current Route");
    switch(settings.name){
      case RouteName.kHomeScreen:
        return _buildHomeScreen();

      default:
        return _buildNotFoundScreen();
    }
  }

  MaterialPageRoute _buildHomeScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kHomeScreen),
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  MosqueDropdownCubit(usecase: sl<MosqueDropdownUsecase>()),
            ),
            BlocProvider(
              create: (context) =>
                  LocationDropdownCubit(usecase: sl<LocationDropdownUsecase>()),
            ),
            BlocProvider(
              create: (context) =>
                  JamatTimeCubit(usecase: sl<JamatTimeUsecase>()),
            ),
          ],
          child: const HomeScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildNotFoundScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kNotFoundScreen),
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Screen Not Found',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }

}