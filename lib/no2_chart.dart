import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/example_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NO2ChartWidget extends StatefulWidget {
  const NO2ChartWidget({super.key});

  @override
  State<NO2ChartWidget> createState() => _NO2ChartWidgetState();
}

class _NO2ChartWidgetState extends State<NO2ChartWidget> {
  late List<ApiData>? no2Data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    no2Data = await fetchNOData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('NO2 Chart'),
      ),
      body: no2Data == null || no2Data == []
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: no2Data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(no2Data![index].siteCode),
                          Text(no2Data![index].dateTime),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(no2Data![index].durationNS.toString()),
                          Text(no2Data![index].scaledValue.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

/**
 * Example of a line chart
 * 
 * body: Center(
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
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
 */