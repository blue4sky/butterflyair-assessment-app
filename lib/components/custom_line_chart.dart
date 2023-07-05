import 'package:butterflyair_assessment_app/components/monthly_bottom_chart_title.dart';
import 'package:butterflyair_assessment_app/components/weekly_bottom_chart_title.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  List<ApiData>? data;
  double divisor;
  bool isWeekly;
  double maxYAxis;

  CustomLineChart({
    Key? key,
    required this.data,
    required this.divisor,
    required this.maxYAxis,
    required this.isWeekly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, left: 8),
      child: AspectRatio(
        aspectRatio: 1,
        child: LineChart(
          LineChartData(
            maxY: maxYAxis,
            minY: 0,
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: isWeekly
                      ? weeklyBottomChartTitleWidgets
                      : monthlyBottomChartTitleWidgets,
                ),
              ),
            ),
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                tooltipBgColor: Colors.black.withOpacity(0.8),
                tooltipRoundedRadius: 8,
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    const textStyle = TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    return LineTooltipItem(
                      // 3 digits after decimal point
                      barSpot.y.toStringAsFixed(3),
                      textStyle,
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                gradient: const LinearGradient(colors: [
                  Color(0xFF50E4FF),
                  Color(0xFF2196F3),
                ]),
                spots: getSpots(data, divisor),
                isCurved: false,
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
