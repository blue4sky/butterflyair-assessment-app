import 'package:butterflyair_assessment_app/screens/pm2.5_screen/pm2.5_monthly_screen.dart';
import 'package:butterflyair_assessment_app/screens/pm2.5_screen/pm2.5_weekly_screen.dart';
import 'package:flutter/material.dart';

class PMChartWidget extends StatefulWidget {
  const PMChartWidget({super.key});

  @override
  State<PMChartWidget> createState() => _PMChartWidgetState();
}

class _PMChartWidgetState extends State<PMChartWidget> {
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
          PMWeeklyChart(),
          PMMonthlyChart()
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
