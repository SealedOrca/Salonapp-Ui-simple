import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Meeting {
  final String id;
  String title;
  final DateTime startTime;
  final DateTime endTime;
  final bool isAllDay;

  Meeting({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
  });
}

class DataSource extends CalendarDataSource {
  DataSource(List<Meeting> meetings) {
    appointments = meetings;
  }
}

class AppointmentEditor extends StatefulWidget {
  final Meeting appointment;
  final DataSource dataSource;

  const AppointmentEditor({super.key, required this.appointment, required this.dataSource});

  @override
  _AppointmentEditorState createState() => _AppointmentEditorState();
}

class _AppointmentEditorState extends State<AppointmentEditor> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.appointment.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Editor'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointment ID: ${widget.appointment.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              onChanged: (value) {
                // Update appointment title
                setState(() {
                  widget.appointment.title = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save appointment logic
                widget.dataSource.notifyListeners(
                  CalendarDataSourceAction.add,
                  <Meeting>[widget.appointment],
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentManagementPage extends StatefulWidget {
  const AppointmentManagementPage({super.key});

  @override
  _AppointmentManagementPageState createState() =>
      _AppointmentManagementPageState();
}

class _AppointmentManagementPageState extends State<AppointmentManagementPage> {
  List<Meeting> meetings = [
    Meeting(
      id: '1',
      title: 'Meeting 1',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
    ),
    Meeting(
      id: '2',
      title: 'Meeting 2',
      startTime: DateTime.now().add(const Duration(hours: 2)),
      endTime: DateTime.now().add(const Duration(hours: 3)),
    ),
  ];

  DataSource dataSource = DataSource([]);

  @override
  void initState() {
    super.initState();
    dataSource = DataSource(meetings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Management'),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        dataSource: dataSource,
        monthViewSettings: const MonthViewSettings(showAgenda: true),
        timeSlotViewSettings: const TimeSlotViewSettings(
          minimumAppointmentDuration: Duration(minutes: 60),
        ),
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.appointment ||
              details.targetElement == CalendarElement.calendarCell) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentEditor(
                  appointment: details.appointments!.first as Meeting,
                  dataSource: dataSource,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AppointmentManagementPage(),
  ));
}
