import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_lab_4/models/exam_model.dart';

class MapScreen extends StatelessWidget {
  final List<Exam> exams;

  const MapScreen({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    final LatLng initialPosition = exams
        .firstWhere(
          (exam) => exam.location != null,
          orElse: () => Exam(
            date: DateTime.now(),
            subject: '',
            location: const LatLng(42.0040144, 21.4086502),
            color: Colors.blue,
          ),
        )
        .location!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Locations'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 12,
        ),
        markers: exams
            .where((exam) => exam.location != null)
            .map(
              (exam) => Marker(
                markerId: MarkerId(exam.subject),
                position: exam.location!,
                infoWindow: InfoWindow(
                  title: exam.subject,
                  snippet: 'Date: ${exam.date}',
                ),
              ),
            )
            .toSet(),
      ),
    );
  }
}
