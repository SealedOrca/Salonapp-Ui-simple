import 'package:flutter/material.dart';

class SettingsConfigurationPage extends StatelessWidget {
  const SettingsConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Configuration'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              navigateToPage(context, const NotificationsSettingsPage());
            },
          ),
          ListTile(
            title: const Text('Appearance'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              navigateToPage(context, const AppearanceSettingsPage());
            },
          ),
          ListTile(
            title: const Text('Account'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              navigateToPage(context, const AccountSettingsPage());
            },
          ),
          // Add more settings options as needed
        ],
      ),
    );
  }

  void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Settings'),
      ),
      body: const Center(
        child: Text('Notifications Settings Page'),
      ),
    );
  }
}

class AppearanceSettingsPage extends StatelessWidget {
  const AppearanceSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appearance Settings'),
      ),
      body: const Center(
        child: Text('Appearance Settings Page'),
      ),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: const Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SettingsConfigurationPage(),
  ));
}
