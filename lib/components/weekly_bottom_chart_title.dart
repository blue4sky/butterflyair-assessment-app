import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget weeklyBottomChartTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Week 1', style: style);
      break;
    case 1:
      text = const Text('Week 2', style: style);
      break;
    case 2:
      text = const Text('Week 3', style: style);
      break;
    case 3:
      text = const Text('Week 4', style: style);
      break;
    case 4:
      text = const Text('Week 5', style: style);
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
