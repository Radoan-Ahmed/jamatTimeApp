import 'package:flutter/material.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/common/presentation/widget/custom_bottom_navigation.dart';
import 'package:jamat_app/features/home/presentation/widget/events_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.location_pin, color: Colors.green),
            SizedBox(width: 8),
            Text('Masjid Connect'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mosque Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Nood Jame Mosque',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '123 Mosque Street, City',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
          
              // Prayer Time Card
              Container(
                width: double.infinity,
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
          
              // Quick Actions
              const Text(
                'Prayer Times',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPrayerGridItem(
                    icon: Icons.access_time,
                    title: 'Prayer Times',
                    color: Colors.blue,
                    onTap: () {
                      // Navigate to prayer times screen
                    },
                  ),
                  _buildPrayerGridItem(
                    icon: Icons.people,
                    title: 'Community',
                    color: Colors.green,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.kCoummunityEvent);
                      // Navigate to community screen
                    },
                  ),
                  _buildPrayerGridItem(
                    icon: Icons.chat,
                    title: 'Ask Imam AI',
                    color: Colors.orange,
                    onTap: () {
                      // Navigate to AI chat screen
                    },
                  ),
                  _buildPrayerGridItem(
                    icon: Icons.volume_up,
                    title: 'Voice Guide',
                    color: Colors.purple,
                    onTap: () {
                      // Navigate to voice guide screen
                    },
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     _buildActionButton(
              //       icon: Icons.access_time,
              //       label: 'Community',
              //       color: Colors.blue,
              //     ),
              //     _buildActionButton(
              //       icon: Icons.chat,
              //       label: 'Ask Imam AI',
              //       color: Colors.orange,
              //     ),
              //     _buildActionButton(
              //       icon: Icons.volume_up,
              //       label: 'Voice Guide',
              //       color: Colors.purple,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 24),
          
              UpcomingEventsSlider(),
          
              // Upcoming Events
              // const Text(
              //   'Upcoming Events',
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 12),
              // _buildEventCard(
              //   title: 'Friday Prayer',
              //   date: 'Friday, 1:00 PM',
              //   action: 'View Details',
              // ),
              // const SizedBox(height: 12),
              // _buildEventCard(
              //   title: 'Islamic Class',
              //   date: 'Saturday, 10:00 AM',
              //   action: 'View',
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.access_time),
      //       label: 'Prayer Times',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.event),
      //       label: 'Events',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildPrayerGridItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
