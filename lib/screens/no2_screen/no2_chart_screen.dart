import 'package:butterflyair_assessment_app/screens/no2_screen/no2_monthly_screen.dart';
import 'package:butterflyair_assessment_app/screens/no2_screen/no2_weekly_screen.dart';
import 'package:flutter/material.dart';

class NO2ChartScreen extends StatefulWidget {
  const NO2ChartScreen({super.key});

  @override
  State<NO2ChartScreen> createState() => _NO2ChartScreenState();
}

class _NO2ChartScreenState extends State<NO2ChartScreen> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('NO2 Chart'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          NO2WeeklyChart(),
          NO2MonthlyChart(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Weekly Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Monthly Chart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
