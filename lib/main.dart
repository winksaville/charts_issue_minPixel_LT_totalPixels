import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String name = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      home: Scaffold(
          appBar: AppBar(title: const Text(name)),
          body: Container(
              child: SimpleLineChart('Data', const <double>[0, 1, 0]))),
    );
  }
}

class SimpleLineChart extends StatelessWidget {
  SimpleLineChart(String title, List<double> data)
      : seriesList = createChartData(title, data);

  final List<charts.Series<double, int>> seriesList;

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
    );
  }

  static List<charts.Series<double, int>> createChartData(
    String title,
    List<double> data,
  ) {
    return <charts.Series<double, int>>[
      charts.Series<double, int>(
        id: title,
        domainFn: (_, int idx) => idx,
        measureFn: (double y, _) => y,
        data: data,
      )
    ];
  }
}
