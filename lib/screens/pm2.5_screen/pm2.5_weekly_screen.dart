import 'package:butterflyair_assessment_app/components/custom_line_chart.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:flutter/material.dart';

class PMWeeklyChart extends StatefulWidget {
  List<ApiData>? pmData;

  PMWeeklyChart({Key? key, required this.pmData}) : super(key: key);

  @override
  State<PMWeeklyChart> createState() => _PMWeeklyChartState();
}

class _PMWeeklyChartState extends State<PMWeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLineChart(
            data: widget.pmData!.sublist(0, 720),
            divisor: 179.7,
            maxYAxis: 35,
            isWeekly: true,
          ),
        ],
      ),
    );
  }
}
