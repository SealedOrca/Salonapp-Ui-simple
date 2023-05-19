import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rive_animation/screens/home/chic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class TheHairloungePage extends StatelessWidget {
  const TheHairloungePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('The Hair Lounge Page'),
      ),
    );
  }
}

class GlamourSalonPage extends StatelessWidget {
  const GlamourSalonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Glamour Salon & Spa Page'),
      ),
    );
  }
}

class StyleStudioPage extends StatelessWidget {
  const StyleStudioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Style Studio Page'),
      ),
    );
  }
}

class TrendyCutsPage extends StatelessWidget {
  const TrendyCutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Trendy Cuts & Colors Page'),
      ),
    );
  }
}

class ChicClassyPage extends StatelessWidget {
  const ChicClassyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chic & Classy Salon Page'),
      ),
    );
  }
}

class BeautyBarPage extends StatelessWidget {
  const BeautyBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('The Beauty Bar Page'),
      ),
    );
  }
}

class Course {
  final String title, description;
  final Color color;
  final String backgroundImage;

  Course({
    required this.title,
    this.description = 'Build Style that leaves an impression',
    this.color = const Color(0xFF7553F6),
    required this.backgroundImage,
  });
}

final List<Course> courses = [
  Course(
    title: "Fasi Cuts",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap1.jpeg',
  ),
  Course(
    title: "Style Studio.",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap2.jpeg',
  ),
  
  Course(
    title: "The Beauty Bar.",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap3.jpeg',
  ),
  
  Course(
    title: "Chic & Classy Salon.",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap4.jpeg',
  ),
  Course(
    title: "Glamour Salon & Spa.",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap6.jpeg',
  ),
  Course(
    title: "The Hair Lounge",
    color: const Color(0xFF80A4FF),
    backgroundImage: 'assets/card/ap5.jpeg',
  ),
];

class CourseCard extends StatelessWidget {
  final String title;
  final Color color;
  final String backgroundImage;

  const CourseCard({
    required this.title,
    required this.color,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding page when the card is tapped
        switch (title) {
          case 'The Hair Lounge':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TheHairloungePage()),
            );
            break;
          case 'Glamour Salon & Spa.':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GlamourSalonPage()),
            );
            break;
          case 'Style Studio.':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StyleStudioPage()),
            );
            break;
          case 'Trendy Cuts & Colors.':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrendyCutsPage()),
            );
            break;
          case 'Chic & Classy Salon.':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SalonApp()),
            );
            break;
          case 'The Beauty Bar.':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BeautyBarPage()),
            );
            break;
        }
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salon App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int index) {
                final course = courses[index];
                return GestureDetector(
                  onTap: () {
                    _navigateToPage(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: course.color,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            course.backgroundImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                course.title,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                course.description,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const TrendyCutsPage();
        break;
      case 1:
        page = const StyleStudioPage();
        break;
      case 2:
        page = const BeautyBarPage();
        break;
      case 3:
        page = const ChicClassyPage();
        break;
      case 4:
        page = const GlamourSalonPage();
        break;
      case 5:
        page = const TheHairloungePage();
        break;
      default:
        page = const SizedBox.shrink();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

