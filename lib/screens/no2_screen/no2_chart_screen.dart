import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/screens/no2_screen/no2_monthly_screen.dart';
import 'package:butterflyair_assessment_app/screens/no2_screen/no2_weekly_screen.dart';
import 'package:flutter/material.dart';

class NO2ChartScreen extends StatefulWidget {
  const NO2ChartScreen({super.key});

  @override
  State<NO2ChartScreen> createState() => _NO2ChartScreenState();
}

class _NO2ChartScreenState extends State<NO2ChartScreen> {
  // For BottomNavigationBar
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // For Fetching API Data
  late List<ApiData>? no2Data = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    no2Data = await fetchNOData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('NO2 Chart'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(
              index: _selectedIndex,
              children: [
                NO2WeeklyChart(no2Data: no2Data!),
                NO2MonthlyChart(no2Data: no2Data!),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_week),
            label: 'Weekly Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Monthly Chart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
