import 'package:flutter/material.dart';

class Service {
  final String name;
  final double price;

  Service({required this.name, required this.price});
}

class Product {
  final String name;
  final double price;
  final String backgroundImage;

  Product(
      {required this.name, required this.price, required this.backgroundImage});
}

class SalonInfo {
  final String name;
  final String profession;
  final String phone;
  final String about;

  SalonInfo({
    required this.name,
    required this.profession,
    required this.phone,
    required this.about,
  });
}

final salonInfo = SalonInfo(
  name: 'Salon',
  profession: 'Stylist',
  phone: '+1 123-456-7890',
  about:
      'Welcome to Chic and Cassy Salon! We are dedicated to providing exceptional salon services and creating a memorable experience for our clients. With our team of highly skilled and passionate stylists, we strive to bring out your unique beauty and enhance your confidence.',
);

final services = [
  Service(name: 'Haircut', price: 50),
  Service(name: 'Coloring', price: 80),
  Service(name: 'Blowout', price: 40),
  Service(name: 'Perm', price: 100),
];

final products = [
  Product(
      name: 'Shampoo',
      price: 15,
      backgroundImage: 'assets/products/shampoo.png'),
  Product(
      name: 'Conditioner',
      price: 15,
      backgroundImage: 'assets/products/conditioner.jpeg'),
  Product(
      name: 'Hair Spray',
      price: 10,
      backgroundImage: 'assets/products/hairspray.jpg'),
];

final onDemandServices = [
  Service(name: 'Bridal Makeup', price: 150),
  Service(name: 'Manicure', price: 30),
];

class SalonApp extends StatefulWidget {
  @override
  _SalonAppState createState() => _SalonAppState();
}

class _SalonAppState extends State<SalonApp>
    with SingleTickerProviderStateMixin {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/backpic/photo.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    buildHeader(),
                    const SizedBox(height: 24),
                    buildSectionTitle('Services'),
                    const SizedBox(height: 16),
                    buildServiceList(),
                    const SizedBox(height: 24),
                    buildSectionTitle('Shop'),
                    const SizedBox(height: 16),
                    buildProductList(),
                    const SizedBox(height: 24),
                    buildSectionTitle('On-Demand Services'),
                    const SizedBox(height: 16),
                    buildOnDemandServiceList(),
                    const SizedBox(height: 24),
                    buildSectionTitle('About'),
                    const SizedBox(height: 16),
                    buildAboutSection(),
                    const SizedBox(height: 24),
                    buildDateTimePicker(),
                    const SizedBox(height: 24),
                    buildAppointmentButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/avatars/avatar.png'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              salonInfo.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              salonInfo.profession,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              salonInfo.phone,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildServiceList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index) {
        final service = services[index];
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final scale =
                1.0 + (_animation.value - index).clamp(0.0, 1.0) * 0.3;
            return Transform.scale(
              scale: scale,
              child: buildServiceCard(service),
            );
          },
        );
      },
    );
  }

  Widget buildProductList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final scale =
                1.0 + (_animation.value - index).clamp(0.0, 1.0) * 0.3;
            return Transform.scale(
              scale: scale,
              child: buildProductCard(product),
            );
          },
        );
      },
    );
  }

  Widget buildOnDemandServiceList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: onDemandServices.length,
      itemBuilder: (BuildContext context, int index) {
        final onDemandService = onDemandServices[index];
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final scale =
                1.0 + (_animation.value - index).clamp(0.0, 1.0) * 0.3;
            return Transform.scale(
              scale: scale,
              child: buildServiceCard(onDemandService),
            );
          },
        );
      },
    );
  }

  Widget buildServiceCard(Service service) {
    bool isChecked = false; // Add your own logic for checking the service

    return CheckboxListTile(
      title: Text(
        service.name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '\$${service.price.toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 16),
      ),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }

  Widget buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                product.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAboutSection() {
    return const Text(
      'Welcome to our salon! We provide high-quality services and products to make you look and feel your best. Our team of experienced professionals is dedicated to delivering exceptional results. Visit us today!',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget buildDateTimePicker() {
    String selectedDate = 'May 17, 2023'; // Replace with the selected date
    String selectedTime = '10:00 AM'; // Replace with the selected time

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () {
            // Handle date picker
          },
        ),
        const SizedBox(width: 8),
        const Text(
          'Selected date:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 8),
        Text(
          selectedDate,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.access_time),
          onPressed: () {
            // Handle time picker
          },
        ),
        const SizedBox(width: 8),
        const Text(
          'Selected time:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 8),
        Text(
          selectedTime,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildAppointmentButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle appointment booking
        },
        child: const Text('Book Appointment'),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(SalonApp());
}
