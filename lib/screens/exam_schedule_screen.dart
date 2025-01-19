import 'package:flutter/material.dart';
import 'package:flutter_lab_4/models/exam_model.dart';
import 'package:flutter_lab_4/widgets/popup_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ExamScheduleScreen extends StatelessWidget {
  final exams = Exam.getExams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exam Schedule")),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: ExamDataSource(exams),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.appointment &&
              details.appointments != null &&
              details.appointments!.isNotEmpty) {
            final Appointment? appointment = details.appointments!.first;

            // Safely find the corresponding Exam
            final exam = exams.firstWhere(
              (exam) =>
                  exam.date.year == appointment!.startTime.year &&
                  exam.date.month == appointment.startTime.month &&
                  exam.date.day == appointment.startTime.day &&
                  exam.date.hour == appointment.startTime.hour &&
                  exam.date.minute == appointment.startTime.minute,
              orElse: () => Exam(
                date: DateTime.now(),
                subject: 'Unknown',
                color: Colors.grey,
              ),
            );

            if (exam.subject != 'Unknown') {
              showDialog(
                context: context,
                builder: (context) => EventDetailsDialog(exam: exam),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exam not found!')),
              );
            }
          }
        },
      ),
    );
  }
}

class ExamDataSource extends CalendarDataSource {
  ExamDataSource(List<Exam> exams) {
    appointments = exams
        .map(
          (exam) => Appointment(
            startTime: exam.date,
            endTime: exam.date.add(const Duration(hours: 2)),
            subject: exam.subject,
            location: exam.location != null ? 'Location Set' : 'No Location',
            color: exam.color, // Use the color from the model
          ),
        )
        .toList();
  }
}
