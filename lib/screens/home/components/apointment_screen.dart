import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const AppointmentApp());
}

class AppointmentApp extends StatelessWidget {
  const AppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AppointmentScreen(),
    );
  }
}

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  String selectedStylist = '';
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: _selectedDate,
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Appointment Time: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Text(
                    selectedTime.format(context),
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Stylist:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            StylistSelectionWidget(
              selectedStylist: selectedStylist,
              onSelectStylist: (stylist) {
                setState(() {
                  selectedStylist = stylist;
                });
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Appointment Confirmation'),
                        content: const Text('Your appointment is booked.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Confirm Appointment'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class StylistSelectionWidget extends StatefulWidget {
  final Function(String) onSelectStylist;
  final String selectedStylist;

  const StylistSelectionWidget({super.key, 
    required this.onSelectStylist,
    required this.selectedStylist,
  });

  @override
  _StylistSelectionWidgetState createState() => _StylistSelectionWidgetState();
}

class _StylistSelectionWidgetState extends State<StylistSelectionWidget> {
  List<String> stylistImages = [
    'assets/stylist/sty1.png',
    'assets/stylist/sty2.png',
    'assets/stylist/sty3.jpeg',
    'assets/stylist/sty3.jpeg',
    'assets/stylist/sty2.png',
    'assets/stylist/sty1.png',
  ];

  List<String> stylistNames = [
    'Hairs Khan',
    'Adeel Tariq',
    'Ahemd Ali',
    'Iffi Malik',
    'Taimor Qausr',
    'Zainab Ali',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stylistImages.length,
          itemBuilder: (BuildContext context, int index) {
            final stylist = stylistImages[index];
            final isSelected = widget.selectedStylist == stylist;

            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onSelectStylist(stylist);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: isSelected
                        ? const BorderSide(color: Colors.blue, width: 2.0)
                        : BorderSide.none,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0),
                          ),
                          child: Image.asset(
                            stylist,
                            width: 160, // Provide a specific width for the image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stylistNames[index],
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
