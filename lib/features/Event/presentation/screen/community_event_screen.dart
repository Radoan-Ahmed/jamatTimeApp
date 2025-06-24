import 'package:flutter/material.dart';
import 'package:jamat_app/core/navigation/route_name.dart';
import 'package:jamat_app/features/Event/presentation/screen/event_details_screen.dart';
import 'package:jamat_app/features/common/presentation/widget/custom_bottom_navigation.dart';

class CommunityEventScreen extends StatefulWidget {
  const CommunityEventScreen({super.key});

  @override
  State<CommunityEventScreen> createState() => _CommunityEventScreenState();
}

class _CommunityEventScreenState extends State<CommunityEventScreen> {
  int _selectedCategory = 0; // 0=All, 1=Prayers, 2=Lectures
  final List<Event> _events = [
    Event(
      title: 'Friday Prayer & Lecture',
      date: 'Friday, Dec 15 • 1:00 PM',
      location: 'Islamic Center of New York',
      category: 'Prayers',
    ),
    Event(
      title: 'Community Iftar Gathering',
      date: 'Saturday, Dec 16 • 5:30 PM',
      location: 'Central Community Hall',
      category: 'Lectures',
    ),
    Event(
      title: 'Quran Study Circle',
      date: 'Sunday, Dec 17 • 6:00 PM',
      location: 'Masjid Al-Rahman',
      category: 'Lectures',
    ),
    Event(
      title: 'Eid Prayer',
      date: 'Monday, Dec 18 • 8:00 AM',
      location: 'Islamic Center of New York',
      category: 'Prayers',
    ),
    Event(
      title: 'Eid Prayer',
      date: 'Monday, Dec 18 • 8:00 AM',
      location: 'Islamic Center of New York',
      category: 'Prayers',
    ),
  ];

  List<Event> get _filteredEvents {
    if (_selectedCategory == 0) return _events;
    final category = _selectedCategory == 1 ? 'Prayers' : 'Lectures';
    return _events.where((e) => e.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Events'),
      ),
      // bottomNavigationBar: const CustomBottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upcoming activities in your area',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('All', 0),
                      const SizedBox(width: 8),
                      _buildCategoryButton('Prayers', 1),
                      const SizedBox(width: 8),
                      _buildCategoryButton('Lectures', 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredEvents.length,
              itemBuilder: (context, index) {
                return _buildEventCard(_filteredEvents[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = index;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor:
            _selectedCategory == index ? Colors.blue[50] : Colors.transparent,
        side: BorderSide(
          color: _selectedCategory == index ? Colors.blue : Colors.grey[300]!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: _selectedCategory == index ? Colors.blue : Colors.black,
        ),
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  event.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  event.location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetailsScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                child: const Text(
                  'See Details',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final String date;
  final String location;
  final String category;

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.category,
  });
}
