import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Grafico extends StatelessWidget {
  const Grafico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: LineChart(
          LineChartData(
            clipData: FlClipData.none(),
            minX: 0,
            maxX: 6,
            minY: 80,
            maxY: 140,
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const dias = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'];
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        dias[value.toInt() % dias.length],
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 20,
                  reservedSize: 45, // 🔽 margem menor
                  getTitlesWidget: (value, meta) => Padding(
                    padding: const EdgeInsets.only(right: 2.0), // 🔽 bem perto da borda
                    child: Text(
                      '${value.toInt()} mg/dL',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Colors.blue,
                belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
                dotData: FlDotData(show: true),
                spots: const [
                  FlSpot(0, 90),
                  FlSpot(1, 118),
                  FlSpot(2, 105),
                  FlSpot(3, 95),
                  FlSpot(4, 132),
                  FlSpot(5, 125),
                  FlSpot(6, 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
