import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:fl_chart/fl_chart.dart';

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
