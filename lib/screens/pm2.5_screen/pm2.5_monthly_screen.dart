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
          CustomLineChart(
            data: widget.pmData,
            divisor: 727,
            maxYAxis: 35,
            isWeekly: false,
          ),
        ],
      ),
    );
  }
}
