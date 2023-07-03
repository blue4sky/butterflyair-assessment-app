import 'package:butterflyair_assessment_app/example_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PMChartWidget extends StatelessWidget {
  final List<ExampleData> points;

  const PMChartWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PM2.5 Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: exampleData
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: false,
                      // dotData: FlDotData(
                      //   show: false,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
