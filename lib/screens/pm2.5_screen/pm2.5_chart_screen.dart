import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/screens/pm2.5_screen/pm2.5_monthly_screen.dart';
import 'package:butterflyair_assessment_app/screens/pm2.5_screen/pm2.5_weekly_screen.dart';
import 'package:flutter/material.dart';

class PMChartWidget extends StatefulWidget {
  const PMChartWidget({super.key});

  @override
  State<PMChartWidget> createState() => _PMChartWidgetState();
}

class _PMChartWidgetState extends State<PMChartWidget> {
  // For BottomNavigationBar
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // For Fetching API Data
  late List<ApiData>? pmData = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    pmData = await fetchPMData();
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
        title: const Text('PM2.5 Chart'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(
              index: _selectedIndex,
              children: [
                PMWeeklyChart(pmData: pmData!),
                PMMonthlyChart(pmData: pmData!)
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
