import 'package:flutter/material.dart';

class GroomingServicesPage extends StatelessWidget {
  const GroomingServicesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grooming Services'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Grooming Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            BarberShopCard(
              title: 'Haircut & Styling',
              description:
                  'Precision haircuts and expert styling tailored to your preferences.',
              icon: Icons.content_cut,
            ),
            SizedBox(height: 20),
            BarberShopCard(
              title: 'Beard Trim & Grooming',
              description:
                  'Expert beard trims and grooming services to keep you looking sharp.',
              icon: Icons.face,
            ),
            SizedBox(height: 20),
            BarberShopCard(
              title: 'Hot Towel Shave',
              description:
                  'Relaxing and rejuvenating hot towel shaves for the ultimate grooming experience.',
              icon: Icons.spa,
            ),
            SizedBox(height: 20),
            BarberShopCard(
              title: 'Facial Treatments',
              description:
                  'Specialized facial treatments to cleanse, nourish, and revitalize your skin.',
              icon: Icons.face_retouching_natural,
            ),
            // Add more barber shop cards here...
          ],
        ),
      ),
    );
  }
}

class BarberShopCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const BarberShopCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  static map(Padding Function(dynamic service) param0) {}
}
