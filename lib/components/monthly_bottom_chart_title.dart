import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget monthlyBottomChartTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Apr', style: style);
      break;
    case 1:
      text = const Text('May', style: style);
      break;
    case 2:
      text = const Text('Jun', style: style);
      break;
    case 3:
      text = const Text('Jul', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
