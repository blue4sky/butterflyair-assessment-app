import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/utils.dart';
import 'package:flutter/material.dart';

class NO2WeeklyChart extends StatefulWidget {
  List<ApiData>? no2Data;

  NO2WeeklyChart({Key? key, required this.no2Data}) : super(key: key);

  @override
  State<NO2WeeklyChart> createState() => _NO2WeeklyChartState();
}

class _NO2WeeklyChartState extends State<NO2WeeklyChart> {
// For the month changer
  int currentMonth = 1; // Start with May

  void goToPreviousMonth() {
    setState(() {
      if (currentMonth > 0) {
        currentMonth--;
      }
    });
  }

  void goToNextMonth() {
    setState(() {
      // Cannot go past June
      if (currentMonth < 2) {
        currentMonth++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  iconSize: 35,
                  color: Colors.lightBlueAccent,
                  onPressed: goToPreviousMonth,
                ),
                Text(
                  '${getMonthName(currentMonth)} 2023',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  iconSize: 35,
                  color: Colors.blueAccent,
                  onPressed: goToNextMonth,
                ),
              ],
            ),
          ),
          CustomLineChart(
            data: widget.no2Data!
                .sublist(startIndexes[currentMonth], endIndexes[currentMonth]),
            divisor: dividers[currentMonth],
            maxYAxis: 140,
            isWeekly: true,
          ),
        ],
      ),
    );
  }
}
