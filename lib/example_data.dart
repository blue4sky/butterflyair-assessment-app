import 'dart:math';
import 'package:collection/collection.dart';

class ExampleData {
  final double x;
  final double y;

  ExampleData({required this.x, required this.y});
}

List<ExampleData> get exampleData {
  final Random random = Random();
  final randomNumbers = <double>[];
  for (var i = 0; i <= 11; i++) {
    randomNumbers.add(random.nextDouble());
  }

  return randomNumbers
      .mapIndexed(
          (index, element) => ExampleData(x: index.toDouble(), y: element))
      .toList();
}
