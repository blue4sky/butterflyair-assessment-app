import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';

class PMMonthlyChart extends StatefulWidget {
  List<ApiData>? pmData;

  PMMonthlyChart({Key? key, required this.pmData}) : super(key: key);

  @override
  State<PMMonthlyChart> createState() => _PMMonthlyChartState();
}

class _PMMonthlyChartState extends State<PMMonthlyChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'April - June 2023',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CustomLineChart(
            data: widget.pmData,
            divisor: 726.5,
            maxYAxis: 35,
            isWeekly: false,
          ),
        ],
      ),
    );
  }
}
