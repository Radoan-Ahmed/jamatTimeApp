import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/dependency/dependency.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/home/domain/usecase/mosque_dropdown_usecase.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_dropdown_cubit.dart';
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