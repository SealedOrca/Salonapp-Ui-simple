import 'package:flutter/material.dart';

class Service {
  final String id;
  final String name;
  final String description;
  final double price;

  Service({required this.id, required this.name, required this.description, required this.price});
}

class ServiceManagementPage extends StatefulWidget {
  const ServiceManagementPage({super.key});

  @override
  _ServiceManagementPageState createState() => _ServiceManagementPageState();
}

class _ServiceManagementPageState extends State<ServiceManagementPage> {
  List<Service> services = [
    Service(id: '1', name: 'Haircut', description: 'Standard haircut', price: 20.0),
    Service(id: '2', name: 'Beard Trim', description: 'Trim and shape beard', price: 10.0),
    Service(id: '3', name: 'Shave', description: 'Close shave with hot towel', price: 15.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Management'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          Service service = services[index];
          return ListTile(
            title: Text(service.name),
            subtitle: Text(service.description),
            trailing: Text('\$${service.price.toStringAsFixed(2)}'),
            onTap: () {
              // Perform action when a service is tapped
              // For example, navigate to a page to edit the service
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Perform action when the add button is pressed
          // For example, navigate to a page to add a new service
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ServiceManagementPage(),
  ));
}
