import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vodth_mobile/core/models/vodth/bar_chart_model.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

class ResultBarChart extends StatelessWidget {
  const ResultBarChart({super.key, required this.chartDatas});

  final List<BarChartModel> chartDatas;

  @override
  Widget build(BuildContext context) {
    chartDatas.sort((a, b) => a.votes!.compareTo(b.votes!));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: SfCartesianChart(
              title: const ChartTitle(text: 'Votes result'),
              primaryXAxis: const CategoryAxis(
                arrangeByIndex: true,
              ),
              primaryYAxis: const NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              series: [
                BarSeries<BarChartModel, String>(
                  dataSource: chartDatas,
                  xValueMapper: (BarChartModel data, _) => data.candidateName,
                  yValueMapper: (BarChartModel data, _) => data.votes,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: ThemeConstant.brandColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
