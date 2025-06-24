import 'package:flutter/material.dart';
import 'package:jamat_app/features/Event/presentation/screen/event_details_screen.dart';
import 'package:jamat_app/features/common/presentation/widget/custom_bottom_navigation.dart';
import 'package:jamat_app/features/home/presentation/screen/home_screen.dart';
import 'package:jamat_app/features/prayerTime/presentation/screen/prayer_time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreens(),
    const PrayerTimesScreen(),
    const EventDetailsScreen(),
    const SizedBox(
      child: Center(
        child: Text('Signout Screen'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}