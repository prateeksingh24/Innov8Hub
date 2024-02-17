import 'package:demo_ui/charts/PricePoints.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> points;
  const LineChartWidget({required this.points,super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(
        lineBarsData : [LineChartBarData(
          spots: points.map((point)=>FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          color:  pColor,
          dotData: const FlDotData(show: true)
        )]
      )),
    );
  }
}
