import 'package:butterflyair_assessment_app/data/api_call.dart';
import 'package:butterflyair_assessment_app/data/api_data.dart';
import 'package:butterflyair_assessment_app/example_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PMChartWidget extends StatefulWidget {

  const PMChartWidget({super.key});

  @override
  State<PMChartWidget> createState() => _PMChartWidgetState();
}

class _PMChartWidgetState extends State<PMChartWidget> {
  late List<ApiData>? pmData = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    pmData = await fetchPMData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PM2.5 Chart'),
      ),
      body: pmData == null || pmData == []
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pmData!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(pmData![index].siteCode),
                          Text(pmData![index].dateTime),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(pmData![index].durationNS.toString()),
                          Text(pmData![index].scaledValue.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
