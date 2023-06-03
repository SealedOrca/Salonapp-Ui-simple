import 'package:flutter/material.dart';

class Barber {
  String name;
  String specialty;
  double serviceCost;
  String about;
  List<String> services;

  Barber({
    required this.name,
    required this.specialty,
    required this.serviceCost,
    required this.about,
    required this.services,
  });
}

class BarberManagementPage extends StatefulWidget {
  const BarberManagementPage({Key? key}) : super(key: key);

  @override
  _BarberManagementPageState createState() => _BarberManagementPageState();
}

class _BarberManagementPageState extends State<BarberManagementPage> {
  List<Barber> barbers = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController serviceCostController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  void addBarber() {
    String name = nameController.text;
    String specialty = specialtyController.text;
    double serviceCost = double.tryParse(serviceCostController.text) ?? 0.0;
    String about = aboutController.text;
    List<String> services = [];

    Barber newBarber = Barber(
      name: name,
      specialty: specialty,
      serviceCost: serviceCost,
      about: about,
      services: services,
    );
    setState(() {
      barbers.add(newBarber);
    });

    // Clear the text fields
    nameController.clear();
    specialtyController.clear();
    serviceCostController.clear();
    aboutController.clear();
  }

  void deleteBarber(int index) {
    setState(() {
      barbers.removeAt(index);
    });
  }

  void addService(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController serviceController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Service'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: serviceController,
                decoration: const InputDecoration(labelText: 'Service'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String service = serviceController.text;
                if (service.isNotEmpty) {
                  setState(() {
                    barbers[index].services.add(service);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void removeService(int barberIndex, int serviceIndex) {
    setState(() {
      barbers[barberIndex].services.removeAt(serviceIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber Management'),
      ),
      body: barbers.isEmpty
          ? const Center(
              child: Text(
                'No barbers available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: barbers.length,
              itemBuilder: (context, index) {
                Barber barber = barbers[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(barber.name),
                  subtitle: Text(barber.specialty),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteBarber(index),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(barber.name),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(barber.about),
                              const SizedBox(height: 16),
                              const Text(
                                'Services:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: barber.services.length,
                                itemBuilder: (context, serviceIndex) {
                                  return ListTile(
                                    title: Text(barber.services[serviceIndex]),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => removeService(index, serviceIndex),
                                    ),
                                  );
                                },
                              ),
                              ElevatedButton(
                                onPressed: () => addService(index),
                                child: const Text('Add Service'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Barber'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: specialtyController,
                      decoration: const InputDecoration(labelText: 'Specialty'),
                    ),
                    TextField(
                      controller: serviceCostController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Service Cost'),
                    ),
                    TextField(
                      controller: aboutController,
                      decoration: const InputDecoration(labelText: 'About'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addBarber();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: BarberManagementPage(),
    ),
  );
}
