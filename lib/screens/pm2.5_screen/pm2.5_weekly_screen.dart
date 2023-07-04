import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PMWeeklyChart extends StatefulWidget {
  List<ApiData>? pmData;

  PMWeeklyChart({Key? key, required this.pmData}) : super(key: key);

  @override
  State<PMWeeklyChart> createState() => _PMWeeklyChartState();
}

class _PMWeeklyChartState extends State<PMWeeklyChart> {
  
  List<FlSpot> get pmSpots {
    List<FlSpot> pmSpotsList = [];
    for (var i = 0; i < widget.pmData!.length; i++) {
      pmSpotsList.add(
        FlSpot(
          pmSpotsList.length.toDouble() / 180,
          widget.pmData![i].scaledValue,
        ),
      );
    }
    return pmSpotsList;
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
                        color: Colors.purpleAccent,
                        spots: pmSpots.sublist(0, 720),
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
