import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NO2MonthlyChart extends StatefulWidget {
  List<ApiData>? no2Data;

  NO2MonthlyChart({Key? key, required this.no2Data}) : super(key: key);

  @override
  State<NO2MonthlyChart> createState() => _NO2MonthlyChartState();
}

class _NO2MonthlyChartState extends State<NO2MonthlyChart> {
  List<FlSpot> get no2Spots {
    List<FlSpot> no2SpotsList = [];
    for (var i = 0; i < widget.no2Data!.length; i++) {
      no2SpotsList.add(
        FlSpot(
          no2SpotsList.length.toDouble() / 720,
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
                        color: Colors.amberAccent,
                        spots: no2Spots,
                        isCurved: false,
                        belowBarData: BarAreaData(
                          show: false,
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
