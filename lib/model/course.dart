import 'package:flutter/material.dart' show BuildContext, Color, Navigator;

class Course {
  final String title, description, iconSrc;
  final Color color;

  Course({
    required this.title,
    this.description = 'Build Style that leaves a impression',
    this.iconSrc = "assets/me/abc.jepg",
    this.color = const Color(0xFF7553F6),
  });
}

final List<Course> courses = [
  Course(
    title: "Fasi Cuts",
  ),
  Course(
    title: "Style Studio.",
    iconSrc: "assets/me/abc.jepg",
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "Animations in Flutter",
    
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "The Beauty Bar.",
    iconSrc: "assets/icons/code.svg",
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "Chic & Classy Salon.",
    iconSrc: "assets/icons/code.svg",
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "Glamour Salon & Spa.",
    iconSrc: "assets/icons/code.svg",
    color: const Color(0xFF80A4FF),
  ),
   Course(
    title: "The Hair Lounge",
    iconSrc: "assets/icons/code.svg",
    color: const Color(0xFF80A4FF),
  ),
];

final List<Course> recentCourses = [
  Course(title: "The Hair Lounge."),
  Course(
    title: "Glamour Salon & Spa.",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
  Course(title: "Style Studio."),
  Course(
    title: "Trendy Cuts & Colors.",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
   Course(title: "Chic & Classy Salon."),
  Course(
    title: "The Beauty Bar.",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/icons/code.svg",
  ),
];

// Example usage
void navigateToRoute(BuildContext context) {
  Navigator.pushReplacementNamed(context, 'landing_page.dart');
}
