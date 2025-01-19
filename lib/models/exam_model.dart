import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Exam {
  DateTime date;
  String subject;
  bool hasLocationReminder;
  Color color;
  LatLng? location;

  Exam({
    required this.date,
    required this.subject,
    required this.color,
    this.location,
    this.hasLocationReminder = false,
  });

  static List<Exam> getExams() {
    return [
      Exam(
        date: DateTime(2025, 1, 15, 8, 30),
        subject: 'Physics Exam',
        location: const LatLng(42.004136893941585, 21.40953984131099),
        color: Colors.blue,
      ),
      Exam(
        date: DateTime(2025, 1, 20, 14, 0),
        subject: 'Chemistry Exam',
        location: const LatLng(42.004582733929205, 21.408130286025415),
        color: Colors.red,
      ),
      Exam(
        date: DateTime(2025, 1, 25, 10, 0),
        subject: 'Biology Exam',
        location: null,
        color: Colors.green,
      ),
      Exam(
        date: DateTime(2025, 1, 26, 9, 0),
        subject: 'English Literature Exam',
        location: const LatLng(42.004136893941585, 21.40953984131099),
        color: Colors.orange,
      ),
      Exam(
        date: DateTime(2025, 1, 28, 11, 30),
        subject: 'World History Exam',
        location: null,
        color: Colors.purple,
      ),
      Exam(
        date: DateTime(2025, 1, 28, 13, 45),
        subject: 'Mathematics Exam',
        location: const LatLng(42.004582733929205, 21.408130286025415),
        color: Colors.teal,
      ),
    ];
  }
}
