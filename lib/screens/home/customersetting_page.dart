import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerSettingsPage(),
    );
  }
}

class CustomerSettingsPage extends StatelessWidget {
  const CustomerSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.blue,
            ),
            title: const Text('Language'),
            onTap: () {
              // Navigate to language settings screen
              _navigateToLanguageSettings(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.blue,
            ),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy screen
              _navigateToPrivacyPolicy(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.alarm,
              color: Colors.blue,
            ),
            title: const Text('Enable Reminders'),
            onTap: () {
              // Toggle reminders
              _toggleReminders();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.nightlight_round,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            onTap: () {
              // Toggle dark mode
              _toggleDarkMode();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: const Text('Edit Profile'),
            onTap: () {
              // Navigate to edit profile screen
              _navigateToEditProfile(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Perform sign out action
              _performSignOut();
            },
          ),
        ],
      ),
    );
  }

  void _navigateToLanguageSettings(BuildContext context) {
    // Replace this with your navigation logic to language settings screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LanguageSettingsScreen()),
    );
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
    // Replace this with your navigation logic to privacy policy screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
    );
  }

  void _toggleReminders() {
    // Replace this with your logic to toggle reminders
    // For example, you can use a boolean flag and update its value accordingly
    bool enableReminders = getEnableReminders();
    enableReminders = !enableReminders;
    setEnableReminders(enableReminders);
    print('Toggling reminders: $enableReminders');
  }

  void _toggleDarkMode() {
    // Replace this with your logic to toggle dark mode
    // For example, you can use a boolean flag and update its value accordingly
    bool darkMode = getDarkMode();
    darkMode = !darkMode;
    setDarkMode(darkMode);
    print('Toggling dark mode: $darkMode');
  }

  void _navigateToEditProfile(BuildContext context) {
    // Replace this with your navigation logic to edit profile screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  }

  void _performSignOut() {
    // Replace this with your sign out logic
    print('Performing sign out');
  }

  bool getEnableReminders() {
    // Replace this with your logic to retrieve the current state of reminders
    // For example, you can use shared preferences or database to store and retrieve the value
    return true; // Assuming the initial state is enabled
  }

  void setEnableReminders(bool value) {
    // Replace this with your logic to update the state of reminders
    // For example, you can use shared preferences or database to store the value
    print('Setting enableReminders to: $value');
  }

  bool getDarkMode() {
    // Replace this with your logic to retrieve the current state of dark mode
    // For example, you can use shared preferences or database to store and retrieve the value
    return false; // Assuming the initial state is disabled
  }

  void setDarkMode(bool value) {
    // Replace this with your logic to update the state of dark mode
    // For example, you can use shared preferences or database to store the value
    print('Setting darkMode to: $value');
  }
}

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
      ),
      body: const Center(
        child: Text('Language Settings Screen'),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Center(
        child: Text(
          'Privacy Policy\n\n'
          'Information We Collect:\n'
          'Personal Information: When you register an account with Barber App, we may collect your name, email address, phone number, and other contact information.\n'
          'Appointment Information: We collect information about your barber appointments, including the date, time, and services requested.\n'
          'Location Information: With your permission, we may collect your location information to provide location-based services, such as finding nearby barbershops.\n\n'
          'Use of Information:\n'
          'Provide Services: We use your personal information to provide and manage barber services, including scheduling appointments, notifying you of updates or changes, and facilitating communication with barbers.\n'
          'Improve User Experience: We may use aggregated and anonymized data to analyze usage patterns, troubleshoot technical issues, and improve the functionality and user experience of the app.\n'
          'Communication: We may use your contact information to send you important notifications, updates, promotions, and marketing materials related to the Barber App. You can opt-out of receiving marketing communications at any time.\n'
          'Legal Compliance: We may use and disclose personal information as required by law, regulations, or legal proceedings.\n\n'
          'Data Sharing:\n'
          'Service Providers: We may share personal information with trusted third-party service providers who assist us in delivering the Barber App\'s services, such as hosting, data analysis, and customer support.\n'
          'Business Transfers: If the Barber App undergoes a merger, acquisition, or sale of assets, personal information may be transferred as part of the transaction, subject to standard confidentiality agreements.\n'
          'User Consent: We may share your personal information with other users or barbers as necessary to facilitate appointment bookings and communication.\n\n'
          'Data Security:\n'
          'We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet or electronic storage is completely secure.\n\n'
          'Contact Us:\n'
          'If you have any questions, concerns, or requests regarding this privacy policy, please contact us at privacy@barberapp.com.',
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: const Center(
        child: Text('Edit Profile Screen'),
      ),
    );
  }
}
