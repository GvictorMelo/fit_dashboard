import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({Key? key}) : super(key: key);

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  final data = <_WeightData>[
    _WeightData(currentTime: DateTime(2022, 05, 12, 8), weight: 65.5),
    _WeightData(currentTime: DateTime(2022, 05, 12, 22), weight: 66.5),
    _WeightData(currentTime: DateTime(2022, 05, 13, 7, 50), weight: 65.5),
    _WeightData(currentTime: DateTime(2022, 05, 13, 12, 10), weight: 65.7),
    _WeightData(currentTime: DateTime(2022, 05, 13, 22, 55), weight: 66.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 400,
              child: SfSparkLineChart.custom(
                width: 8,
                axisLineWidth: 4,
                //Enable the trackball
                trackball: const SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                //Enable marker
                marker: const SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all,
                ),

                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].currentTime,
                yValueMapper: (int index) => data[index].weight,
                dataCount: data.length,
              ),
            ),
          )
        ],
      ),
      bottomSheet: FloatingActionButton(
        onPressed: () => showBarModalBottomSheet(
            context: context,
            builder: (_) {
              return Form(
                child: Container(),
              );
            }),
      ),
    );
  }
}

class _WeightData {
  _WeightData({required this.currentTime, required this.weight});

  final DateTime currentTime;
  final double weight;
}
