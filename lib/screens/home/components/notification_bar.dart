import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        primaryColor: Colors.blue, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      ),
      home: const MyHomePage(),
      routes: {
        '/notificationInfo': (context) => const NotificationInfoPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return buildNotificationItem(context, index);
        },
      ),
    );
  }

  Widget buildNotificationItem(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).hintColor,
        child: const Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      title: const Text(
        'New Message',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        'You have a new message from John Doe.',
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/notificationInfo',
          arguments: {
            'title': 'New Message',
            'message': 'You have a new message from John Doe.',
          },
        );
      },
    );
  }
}

class NotificationInfoPage extends StatelessWidget {
  const NotificationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              args['title'] ?? 'No Title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              args['message'] ?? 'No Message',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
