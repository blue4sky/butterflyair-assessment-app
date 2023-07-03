import 'package:butterflyair_assessment_app/no2_chart.dart';
import 'package:butterflyair_assessment_app/pm2.5_chart.dart';
import 'package:butterflyair_assessment_app/example_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Butterfly Air Assessment App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Butterfly Air Assessment App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PMChartWidget(exampleData),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                disabledForegroundColor: Colors.grey,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: const Text('PM2.5 Chart'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NO2ChartWidget(exampleData),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                disabledForegroundColor: Colors.grey,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: const Text('NO2 Chart'),
            ),
          ],
        ),
      ),
    );
  }
}
