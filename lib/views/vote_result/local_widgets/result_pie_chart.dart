import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vodth_mobile/constant/config_constant.dart';
import 'package:vodth_mobile/themes/theme_constant.dart';

class ResultPieChart extends StatelessWidget {
  const ResultPieChart({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                width: 150,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: ThemeConstant.brandColor,
                        value: 40,
                        title: '40%',
                        radius: 50,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      PieChartSectionData(
                        color: const Color(0xFF00E4ED),
                        value: 60,
                        title: '60%',
                        radius: 50,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ConfigConstant.sizedBoxW2,
          ConfigConstant.sizedBoxW2,
          const Text(
            'Total Votes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
