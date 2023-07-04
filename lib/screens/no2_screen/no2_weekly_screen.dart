import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NO2WeeklyChart extends StatefulWidget {
  List<ApiData>? no2Data;

  NO2WeeklyChart({Key? key, required this.no2Data}) : super(key: key);

  @override
  State<NO2WeeklyChart> createState() => _NO2WeeklyChartState();
}

class _NO2WeeklyChartState extends State<NO2WeeklyChart> {
  List<FlSpot> get no2Spots {
    List<FlSpot> no2SpotsList = [];
    for (var i = 0; i < widget.no2Data!.length; i++) {
      no2SpotsList.add(
        FlSpot(
          no2SpotsList.length.toDouble() / 180,
          widget.no2Data![i].scaledValue,
        ),
      );
    }
    return no2SpotsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                        color: Colors.blueAccent,
                        spots: no2Spots.sublist(0, 720),
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
