import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
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

  List<FlSpot> get no2Spots {
    List<FlSpot> no2SpotsList = [];
    for (var i = 0; i < no2Data!.length; i++) {
      no2SpotsList.add(
        FlSpot(
          no2SpotsList.length.toDouble() / 720,
          no2Data![i].scaledValue,
        ),
      );
    }
    return no2SpotsList;
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
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: LineChart(
                        LineChartData(
                          maxY: 140,
                          minY: 0,
                          titlesData: const FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: no2Spots,
                              isCurved: false,
                              belowBarData: BarAreaData(
                                show: true,
                              ),
                              dotData: const FlDotData(
                                show: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
