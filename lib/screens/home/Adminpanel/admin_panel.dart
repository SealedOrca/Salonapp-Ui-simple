import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

void main() {
  runApp(const BarbershopAdminPanel());
}

class BarbershopAdminPanel extends StatefulWidget {
  const BarbershopAdminPanel({super.key});

  @override
  _BarbershopAdminPanelState createState() => _BarbershopAdminPanelState();
}

class _BarbershopAdminPanelState extends State<BarbershopAdminPanel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: Scaffold(
        key: _scaffoldKey, // Add the key to the Scaffold
        appBar: AppBar(
          title: const Text('Barbershop Admin Panel'),
          // Add a hamburger menu icon to open the drawer
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: const BarbershopDrawer(),
        body: const DashboardScreen(),
      ),
      routes: {
        '/appointmentManagement': (context) => const AppointmentManagementPage(),
        '/barberManagement': (context) => const BarberManagementPage(),
        '/customerManagement': (context) => const CustomerManagementPage(),
        '/serviceManagement': (context) => const ServiceManagementPage(),
        '/inventoryManagement': (context) => const InventoryManagementPage(),
        '/reportingAnalytics': (context) => const ReportingAnalyticsPage(),
        '/paymentsInvoicing': (context) => const PaymentsInvoicingPage(),
        '/notificationsCommunication': (context) =>
            const NotificationsCommunicationPage(),
        '/settingsConfiguration': (context) => const SettingsConfigurationPage(),
      },
    );
  }
}

class BarbershopDrawer extends StatelessWidget {
  const BarbershopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Barbershop Admin Panel',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          buildDrawerItem(context, 'Appointment Management', EvaIcons.calendarOutline,
              '/appointmentManagement'),
          buildDrawerItem(context, 'Barber Management', EvaIcons.personOutline,
              '/barberManagement'),
          buildDrawerItem(context, 'Customer Management', EvaIcons.peopleOutline,
              '/customerManagement'),
          buildDrawerItem(context, 'Service Management', EvaIcons.cubeOutline,
              '/serviceManagement'),
          buildDrawerItem(context, 'Inventory Management', EvaIcons.archiveOutline,
              '/inventoryManagement'),
          buildDrawerItem(context, 'Reporting and Analytics', EvaIcons.barChart2Outline,
              '/reportingAnalytics'),
          buildDrawerItem(context, 'Payments and Invoicing', EvaIcons.creditCardOutline,
              '/paymentsInvoicing'),
          buildDrawerItem(context, 'Notifications and Communication',
              EvaIcons.bellOutline, '/notificationsCommunication'),
          buildDrawerItem(context, 'Settings and Configuration', EvaIcons.settings2Outline,
              '/settingsConfiguration'),
        ],
      ),
    );
  }

  Widget buildDrawerItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarbershopDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return _buildCard(
                  iconData: EvaIcons.checkmarkCircle2Outline,
                  label: 'Task Manager',
                  value: 'Completed: 75%',
                  onPressed: () {
                    print('Task Manager button pressed');
                  },
                );
              case 1:
                return _buildCard(
                  iconData: EvaIcons.calendarOutline,
                  label: 'Appointments',
                  value: 'Today: 5',
                  onPressed: () {
                    print('Appointments button pressed');
                  },
                );
              case 2:
                return _buildCard(
                  iconData: EvaIcons.peopleOutline,
                  label: 'Customers',
                  value: 'Total: 100',
                  onPressed: () {
                    print('Customers button pressed');
                  },
                );
              case 3:
                return _buildCard(
                  iconData: EvaIcons.personOutline,
                  label: 'Barbers',
                  value: 'Total: 10',
                  onPressed: () {
                    print('Barbers button pressed');
                  },
                );
              case 4:
                return _buildCard(
                  iconData: EvaIcons.creditCardOutline,
                  label: 'Payments',
                  value: 'Pending: 2',
                  onPressed: () {
                    print('Payments button pressed');
                  },
                );
              case 5:
                return _buildCard(
                  iconData: EvaIcons.settingsOutline,
                  label: 'Settings',
                  value: '',
                  onPressed: () {
                    print('Settings button pressed');
                  },
                );
              case 6:
                return _buildCard(
                  iconData: EvaIcons.bellOutline,
                  label: 'Notifications',
                  value: '',
                  onPressed: () {
                    print('Notifications button pressed');
                  },
                );
              case 7:
                return _buildCard(
                  iconData: EvaIcons.alertCircleOutline,
                  label: 'Alerts',
                  value: 'Total: 3',
                  onPressed: () {
                    print('Alerts button pressed');
                  },
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData iconData,
    required String label,
    required String value,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo[900]!, Colors.pink[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 32.0,
              color: Colors.white,
            ),
            const SizedBox(height: 16.0),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentManagementPage extends StatelessWidget {
  const AppointmentManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Management'),
      ),
      body: const Center(
        child: Text('Appointment Management Page'),
      ),
    );
  }
}

class BarberManagementPage extends StatelessWidget {
  const BarberManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber Management'),
      ),
      body: const Center(
        child: Text('Barber Management Page'),
      ),
    );
  }
}

class CustomerManagementPage extends StatelessWidget {
  const CustomerManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Management'),
      ),
      body: const Center(
        child: Text('Customer Management Page'),
      ),
    );
  }
}

class ServiceManagementPage extends StatelessWidget {
  const ServiceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Management'),
      ),
      body: const Center(
        child: Text('Service Management Page'),
      ),
    );
  }
}

class InventoryManagementPage extends StatelessWidget {
  const InventoryManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: const Center(
        child: Text('Inventory Management Page'),
      ),
    );
  }
}

class ReportingAnalyticsPage extends StatelessWidget {
  const ReportingAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporting and Analytics'),
      ),
      body: const Center(
        child: Text('Reporting and Analytics Page'),
      ),
    );
  }
}

class PaymentsInvoicingPage extends StatelessWidget {
  const PaymentsInvoicingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments and Invoicing'),
      ),
      body: const Center(
        child: Text('Payments and Invoicing Page'),
      ),
    );
  }
}

class NotificationsCommunicationPage extends StatelessWidget {
  const NotificationsCommunicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications and Communication'),
      ),
      body: const Center(
        child: Text('Notifications and Communication Page'),
      ),
    );
  }
}

class SettingsConfigurationPage extends StatelessWidget {
  const SettingsConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings and Configuration'),
      ),
      body: const Center(
        child: Text('Settings and Configuration Page'),
      ),
    );
  }
}
