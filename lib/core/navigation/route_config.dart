import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/dependency/dependency.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/Event/presentation/screen/community_event_screen.dart';
import 'package:jamat_app/features/home/domain/usecase/global_prayer_time_usecase.dart';
import 'package:jamat_app/features/home/domain/usecase/mosque_dropdown_usecase.dart';
import 'package:jamat_app/features/home/presentation/cubit/global_prayer_time_api_cubit/global_prayer_time_api_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';
import 'package:jamat_app/features/home/presentation/screen/home_screens.dart';
import 'package:jamat_app/features/prayerTime/presentation/screen/prayer_time_screen.dart';
import 'package:jamat_app/features/signIn/presentation/screen/signin_screen.dart';
import 'package:jamat_app/features/signUp/presentation/screen/signup_general_user_screen.dart';

class RouteConfig {
  Route routes(RouteSettings settings) {
    log("${settings.name}", name: "Current Route");
    switch (settings.name) {
      case RouteName.kSignUpScreen:
        return _buildSignUpScreen();
      case RouteName.kHomeScreen:
        return _buildHomeScreen();
      case RouteName.kSigninScreen:
        return _buildSignInScreen();
      case RouteName.kPrayerTimes:
        return _buildPrayerTimesScreen();
      case RouteName.kCoummunityEvent:
        return _buildCommunityEventScreen();
      case RouteName.kEventDetailScreen:
        return _buildEventScreen();
      default:
        return _buildNotFoundScreen();
    }
  }

  MaterialPageRoute _buildEventScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kCoummunityEvent),
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const CommunityEventScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildCommunityEventScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kCoummunityEvent),
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const CommunityEventScreen(),
        );
      },
    );
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const HomeScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildPrayerTimesScreen() {
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const PrayerTimesScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildSignUpScreen() {
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const SignUpGeneralUserScreen(),
        );
      },
    );
  }

  MaterialPageRoute _buildSignInScreen() {
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
              create: (context) => GlobalPrayerTimeApiCubit(
                  usecase: sl<GlobalPrayerTimeUsecase>()),
            ),
          ],
          child: const SigninScreen(),
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
