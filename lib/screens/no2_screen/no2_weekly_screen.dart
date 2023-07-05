import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';

class NO2WeeklyChart extends StatefulWidget {
  List<ApiData>? no2Data;

  NO2WeeklyChart({Key? key, required this.no2Data}) : super(key: key);

  @override
  State<NO2WeeklyChart> createState() => _NO2WeeklyChartState();
}

class _NO2WeeklyChartState extends State<NO2WeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLineChart(
            data: widget.no2Data!.sublist(0, 720),
            divisor: 179.7,
            maxYAxis: 140,
            isWeekly: true,
          ),
        ],
      ),
    );
  }
}
