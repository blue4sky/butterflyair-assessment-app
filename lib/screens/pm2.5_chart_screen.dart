import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PMChartWidget extends StatefulWidget {
  const PMChartWidget({super.key});

  @override
  State<PMChartWidget> createState() => _PMChartWidgetState();
}

class _PMChartWidgetState extends State<PMChartWidget> {
  late List<ApiData>? pmData = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    pmData = await fetchPMData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  List<FlSpot> get pmSpots {
    List<FlSpot> pmSpotsList = [];
    for (var i = 0; i < pmData!.length; i++) {
      pmSpotsList.add(
        FlSpot(
          pmSpotsList.length.toDouble() / 720,
          pmData![i].scaledValue,
        ),
      );
    }
    return pmSpotsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PM2.5 Chart'),
      ),
      body: pmData == null || pmData == []
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
                          maxY: 35,
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
                              spots: pmSpots,
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
