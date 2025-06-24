import 'package:flutter/material.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/common/presentation/widget/custom_bottom_navigation.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, RouteName.kHomeScreen, (route)=> false);
          },
        ),
        title: const Text('Masjid Connect'),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Prayer Time Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Asr Prayer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '3:45 PM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Next prayer in 2 hours 15 minutes',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Today's Jamat Times
            const Text(
              "Today's Jamat Times",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildPrayerTimeItem(
              prayerName: 'Fajr',
              time: '5:15 AM',
              status: 'Completed',
            ),
            _buildPrayerTimeItem(
              prayerName: 'Dhuhr',
              time: '1:30 PM',
              status: 'Completed',
            ),
            _buildPrayerTimeItem(
              prayerName: 'Asr',
              time: '3:45 PM',
              status: 'Current',
              isCurrent: true,
            ),
            _buildPrayerTimeItem(
              prayerName: 'Maghrib',
              time: '6:15 PM',
              status: 'Upcoming',
            ),
            _buildPrayerTimeItem(
              prayerName: 'Isha',
              time: '7:45 PM',
              status: 'Upcoming',
            ),
            const SizedBox(height: 24),

            // Jumu'ah Prayer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.mosque, color: Colors.green),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Jumu'ah Prayer\nEvery Friday at 1:30 PM",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  Widget _buildPrayerTimeItem({
    required String prayerName,
    required String time,
    required String status,
    bool isCurrent = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.green.withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: isCurrent
            ? Border.all(color: Colors.green)
            : Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prayerName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isCurrent ? Colors.green : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  color: isCurrent ? Colors.green : Colors.grey[600],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isCurrent ? Colors.green : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: isCurrent ? Colors.white : Colors.grey[700],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
