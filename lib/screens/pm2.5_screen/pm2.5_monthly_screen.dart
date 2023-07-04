import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PMMonthlyChart extends StatefulWidget {
  const PMMonthlyChart({super.key});

  @override
  State<PMMonthlyChart> createState() => _PMMonthlyChartState();
}

class _PMMonthlyChartState extends State<PMMonthlyChart> {
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
          pmSpotsList.length.toDouble() / 732,
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
