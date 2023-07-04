import 'package:butterflyair_assessment_app/components/basic_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Butterfly Air Assessment App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select a chart to view',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            BasicButton(routeName: '/pm_chart', textButton: 'PM2.5 Chart'),
            const SizedBox(height: 20),
            BasicButton(routeName: '/no2_chart', textButton: 'NO2 Chart'),
          ],
        ),
      ),
    );
  }
}
