import 'package:ctrl_real/src/features/home/widgets/indicatorpichart.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: DChartPie(
              animationDuration: const Duration(seconds: 1),
              data: [
                {'domain': 'Supermercado', 'measure': 20},
                {'domain': 'Transporte', 'measure': 20},
                {'domain': 'Pagamentos', 'measure': 20},
                {'domain': 'Lazer', 'measure': 20},
                {'domain': 'Farmacia', 'measure': 10},
                {'domain': 'Gastos extras', 'measure': 10},
              ],
              fillColor: (pieData, index) {
                switch (pieData['domain']) {
                  case 'Supermercado':
                    return Color(0xff8D32E3);
                  case 'Transporte':
                    return Color(0xffD841E8);
                  case 'Pagamentos':
                    return Color(0xff845bef);
                  case 'Lazer':
                    return Color(0xff4964B8);
                  case 'Farmacia':
                    return Color(0xff2C25FA);
                  case 'Gastos extras':
                    return Color(0xff8400DB);
                  default:
                  return Colors.white;
                }
              },
              donutWidth: 35,
              labelColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff8D32E3),
                text: 'Supermercado',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xffD841E8),
                text: 'Transporte',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: 'Pagamentos',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff4964B8),
                text: 'Lazer',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff2C25FA),
                text: 'Farmácia',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff8400DB),
                text: 'Gastos extras',
                isSquare: true,
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ],
    );
  }
}
