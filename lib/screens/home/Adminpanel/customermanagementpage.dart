import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}

enum FilterOption {
  All,
  Name,
  Email,
  Phone,
  ID,
}

class CustomerManagementPage extends StatefulWidget {
  const CustomerManagementPage({super.key});

  @override
  _CustomerManagementPageState createState() => _CustomerManagementPageState();
}

class _CustomerManagementPageState extends State<CustomerManagementPage> {
  List<Customer> customers = [];
  List<Customer> filteredCustomers = [];
  TextEditingController searchController = TextEditingController();
  FilterOption selectedFilter = FilterOption.All;

  @override
  void initState() {
    super.initState();
    generateCustomers();
  }

  void generateCustomers() {
    for (int i = 1; i <= 40; i++) {
      String id = i.toString();
      String name = 'Customer $i';
      String email = 'customer$i@example.com';
      String phone = '123-456-789$i';

      Customer customer = Customer(id: id, name: name, email: email, phone: phone);
      customers.add(customer);
    }
    filteredCustomers = List.from(customers);
  }

  void filterCustomers(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredCustomers = customers.where((customer) {
          if (selectedFilter == FilterOption.Name) {
            return customer.name.toLowerCase().contains(query.toLowerCase());
          } else if (selectedFilter == FilterOption.Email) {
            return customer.email.toLowerCase().contains(query.toLowerCase());
          } else if (selectedFilter == FilterOption.Phone) {
            return customer.phone.toLowerCase().contains(query.toLowerCase());
          } else if (selectedFilter == FilterOption.ID) {
            return customer.id.toLowerCase().contains(query.toLowerCase());
          } else {
            return customer.name.toLowerCase().contains(query.toLowerCase()) ||
                customer.email.toLowerCase().contains(query.toLowerCase()) ||
                customer.phone.toLowerCase().contains(query.toLowerCase()) ||
                customer.id.toLowerCase().contains(query.toLowerCase());
          }
        }).toList();
      } else {
        filteredCustomers = List.from(customers);
      }
    });
  }

  void setFilterOption(FilterOption option) {
    setState(() {
      selectedFilter = option;
    });
  }

  IconData getFilterOptionIcon(FilterOption option) {
    switch (option) {
      case FilterOption.Name:
        return EvaIcons.person;
      case FilterOption.Email:
        return EvaIcons.email;
      case FilterOption.Phone:
        return EvaIcons.phone;
      case FilterOption.ID:
        return EvaIcons.hash;
      default:
        return EvaIcons.gridOutline;
    }
  }

  String getFilterOptionText(FilterOption option) {
    switch (option) {
      case FilterOption.Name:
        return 'Name';
      case FilterOption.Email:
        return 'Email';
      case FilterOption.Phone:
        return 'Phone';
      case FilterOption.ID:
        return 'ID';
      default:
        return 'All';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Customer Management'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        filterCustomers(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  PopupMenuButton<FilterOption>(
                    icon: Icon(getFilterOptionIcon(selectedFilter)),
                    onSelected: setFilterOption,
                    itemBuilder: (BuildContext context) {
                      return FilterOption.values.map((option) {
                        return PopupMenuItem<FilterOption>(
                          value: option,
                          child: Text(getFilterOptionText(option)),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCustomers.length,
                itemBuilder: (context, index) {
                  Customer customer = filteredCustomers[index];
                  return ListTile(
                    title: Text(
                      customer.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email: ${customer.email}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Phone: ${customer.phone}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          customers.removeWhere((item) => item.id == customer.id);
                          filteredCustomers.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerDetailsPage(customer: customer)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // Navigate to customer creation page or perform any other action
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Open menu or perform any other action
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Perform search action
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        // Open filter options or perform any other action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerDetailsPage extends StatelessWidget {
  final Customer customer;

  const CustomerDetailsPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Customer ID: ${customer.id}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Name: ${customer.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${customer.email}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone: ${customer.phone}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const CustomerManagementApp());
}

class CustomerManagementApp extends StatelessWidget {
  const CustomerManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      home: const CustomerManagementPage(),
    );
  }
}
