import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_app/core/navigation/route_name.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 15,
          backgroundColor: const Color(0xff0079B8),
          items: [
            BottomNavigationBarItem(
              icon: bottomIcon("assets/images/icon_dashboard.svg", 15, 20),
              label: "dashboard",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon("assets/images/icon_home.svg", 15, 25),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: bottomIcon("assets/images/logout-outlined.svg", 20, 25),
              label: "Sign Out",
            ),
          ],
          onTap: (index) {
            if (index == 1 &&
                ModalRoute.of(context)!.settings.name != '/Home') {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.kHomeScreen,
                (route) => false,
              );
            } else if (index == 0) {
              if (ModalRoute.of(context)!.settings.name != '/PrayerTimes') {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.kPrayerTimes,
                  (route) => false,
                );
              }
            } else if (index == 2) {
              // showSignOutDialog(context);
              // showColoredDialog(
              //   context,
              //   "Do you want to sign out?",
              //   showYesNoButton: true,
              //   onPressed: () {
              //     context.read<SignOutCubit>().requestSignOut();
              //   }
              // );
            }
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 12,
        ),
      ),
    );
  }

  Widget bottomIcon(String iconPath, double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SvgPicture.asset(
        iconPath,
        width: width,
        height: height,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
