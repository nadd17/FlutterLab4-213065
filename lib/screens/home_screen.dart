import 'package:flutter/material.dart';
import 'package:flutter_lab_4/models/exam_model.dart';
import 'package:flutter_lab_4/screens/contact_us_screen.dart';
import 'package:flutter_lab_4/screens/exam_schedule_screen.dart';
import 'package:flutter_lab_4/screens/map_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Exam> exams;

  const HomeScreen({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Tracker Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Description Box
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Welcome to the Exam Tracker App! This app helps you keep track of your upcoming exams, '
                'view them on a calendar, and locate exam venues on a map. Stay organized and never miss an exam!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavigationButton(
                  context: context,
                  label: 'Contact Us',
                  icon: Icons.contact_mail,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUsScreen(),
                      ),
                    );
                  },
                ),
                _buildNavigationButton(
                  context: context,
                  label: 'View Map',
                  icon: Icons.map,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapScreen(exams: exams), 
                      ),
                    );
                  },
                ),
                _buildNavigationButton(
                  context: context,
                  label: 'View Calendar',
                  icon: Icons.calendar_today,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamScheduleScreen(), 
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
