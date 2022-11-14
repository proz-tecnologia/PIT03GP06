import 'package:ctrl_real/src/controllers/providercontrolers/categoriesprovider.dart';
import 'package:ctrl_real/src/features/home/widgets/indicatorpichart.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {

  @override
  Widget build(BuildContext context) {

    return Consumer<CategoriesController>(
      builder: (context, categories, child) =>
      Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: DChartPie(
                labelLinelength: 4,
                strokeWidth: 1,
                animationDuration: const Duration(seconds: 1),
                data: [
                  {'domain': 'Supermercado', 'measure': categories.porncetSupermec()},
                  {'domain': 'Transporte', 'measure': categories.porncetTranspor()},
                  {'domain': 'Pagamentos', 'measure': categories.porncetPagaments()},
                  {'domain': 'Lazer', 'measure': categories.porncetLazer()},
                  {'domain': 'Farmacia', 'measure': categories.porcentFarmac()},
                  {'domain': 'Gastos extras', 'measure': categories.porncetGastosExs()},
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
                      return Color.fromARGB(255, 91, 0, 152);
                    
                    default:
                    return Colors.white;
                  }
                },
                labelFontSize: 12,
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
                  color: Color.fromARGB(255, 91, 0, 152),
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
      ),
    );
  }
}
