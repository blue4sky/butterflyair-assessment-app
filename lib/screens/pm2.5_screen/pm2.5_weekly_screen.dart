import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/utils.dart';
import 'package:flutter/material.dart';

class PMWeeklyChart extends StatefulWidget {
  List<ApiData>? pmData;

  PMWeeklyChart({Key? key, required this.pmData}) : super(key: key);

  @override
  State<PMWeeklyChart> createState() => _PMWeeklyChartState();
}

class _PMWeeklyChartState extends State<PMWeeklyChart> {
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
            data: widget.pmData!
                .sublist(startIndexes[currentMonth], endIndexes[currentMonth]),
            divisor: dividers[currentMonth],
            maxYAxis: 35,
            isWeekly: true,
          ),
        ],
      ),
    );
  }
}
