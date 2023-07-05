import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:fl_chart/fl_chart.dart';

/// For plotting the line chart
List<FlSpot> getSpots(List<ApiData>? data, double divisor) {
  List<FlSpot> spotsList = [];
  for (var i = 0; i < data!.length; i++) {
    spotsList.add(
      FlSpot(
        spotsList.length.toDouble() / divisor,
        data[i].scaledValue,
      ),
    );
  }
  return spotsList;
}

/// For the month changer
String getMonthName(int monthIndex) {
  List<String> monthNames = ['April', 'May', 'June'];
  return monthNames[monthIndex];
}

List<int> startIndexes = [0, 719, 1461];
List<int> endIndexes = [719, 1461, 2181];
List<double> dividers = [179.5, 185.2, 179.7];
