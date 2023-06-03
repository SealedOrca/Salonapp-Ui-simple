import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class CustomerAnalytics {
  final String customerName;
  final int visits;

  CustomerAnalytics(this.customerName, this.visits);
}

List<CustomerAnalytics> generateSampleData() {
  List<CustomerAnalytics> data = [];
  for (int i = 1; i <= 40; i++) {
    data.add(CustomerAnalytics('Customer $i', i * 10));
  }
  return data;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loglytics Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ReportPage(),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomerAnalytics> data = generateSampleData();

    return Scaffold(
      appBar: AppBar(title: const Text('Reporting and Analytics')),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reporting and Analytics Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 400,
                child: BarChart(
                  BarChartData(
                    barGroups: data.map((analytics) {
                      return BarChartGroupData(
                        x: data.indexOf(analytics),
                        barRods: [
                          BarChartRodData(
                            toY: analytics.visits.toDouble(),
                            color: Colors.red,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
