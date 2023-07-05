import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';

class NO2MonthlyChart extends StatefulWidget {
  List<ApiData>? no2Data;

  NO2MonthlyChart({Key? key, required this.no2Data}) : super(key: key);

  @override
  State<NO2MonthlyChart> createState() => _NO2MonthlyChartState();
}

class _NO2MonthlyChartState extends State<NO2MonthlyChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLineChart(
            data: widget.no2Data,
            divisor: 727,
            maxYAxis: 140,
            isWeekly: false,
          ),
        ],
      ),
    );
  }
}
