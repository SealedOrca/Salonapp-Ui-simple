import 'package:flutter/material.dart';

class Notification {
  final String id;
  final String title;
  final String message;

  Notification({required this.id, required this.title, required this.message});
}

class NotificationCommunicationPage extends StatefulWidget {
  const NotificationCommunicationPage({super.key});

  @override
  _NotificationCommunicationPageState createState() => _NotificationCommunicationPageState();
}

class _NotificationCommunicationPageState extends State<NotificationCommunicationPage> {
  List<Notification> notifications = [
    Notification(id: '1', title: 'Notification 1', message: 'This is the first notification.'),
    Notification(id: '2', title: 'Notification 2', message: 'This is the second notification.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Communication'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          Notification notification = notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.message),
            onTap: () {
              // Perform action when a notification is tapped
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(notification.title),
                    content: Text(notification.message),
                    actions: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Perform action when the add button is pressed
          // For example, navigate to a page to create a new notification
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NotificationCommunicationPage(),
  ));
}
