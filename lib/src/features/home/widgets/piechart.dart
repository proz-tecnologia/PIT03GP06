import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/features/home/widgets/indicatorpichart.dart';
import 'package:fl_chart/fl_chart.dart';
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
    return Row(
      children: [
        loadGrafico(),
        Column(
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
      ],
    );
  }

  loadGrafico() {
    return Padding(
      padding: const EdgeInsets.only(right: 32, left: 12),
      child: AspectRatio(
        aspectRatio: 1,
        child: Consumer<HistoryController>(
          builder: (context, controle, __) => (PieChart(
            PieChartData(
              centerSpaceRadius: 26,
              sections: List.generate(6, (i) {
                const fontSize = 8.0;
                const radius = 42.0;
                switch (i) {
                  case 0:
                    return PieChartSectionData(
                      color: const Color(0xff8D32E3),
                      value: controle.supermerc != 0 ? controle.supermerc : 0.001,
                      title: controle.supermerc.toString() != '0' ? '${controle.porcentSupermerc(controle.supermerc).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 1:
                    return PieChartSectionData(
                      color: const Color(0xffD841E8),
                      value: controle.transpor != 0 ? controle.transpor : 0.001,
                      title: controle.transpor.toString() != '0' ? '${controle.porcentTranspor(controle.transpor).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    );
                  case 2:
                    return PieChartSectionData(
                      color: const Color(0xff845bef),
                      value: controle.pagament != 0 ? controle.pagament : 0.001,
                      title: controle.pagament.toString() != '0' ? '${controle.porcentPagament(controle.pagament).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    );
                  case 3:
                    return PieChartSectionData(
                      color: const Color(0xff4964B8),
                      value: controle.lazer != 0 ? controle.lazer : 0.001,
                      title: controle.lazer.toString() != '0' ? '${controle.porcentLazer(controle.lazer).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    );
                  case 4:
                    return PieChartSectionData(
                      color: const Color(0xff2C25FA),
                      value: controle.pagament != 0 ? controle.farmac : 0.001,
                      title: controle.farmac.toString() != '0' ? '${controle.porcentFarmac(controle.farmac).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    );
                  case 5:
                    return PieChartSectionData(
                      color: const Color.fromARGB(255, 91, 0, 152),
                      value: controle.gastosex != 0 ? controle.gastosex : 0.001,
                      title: controle.gastosex.toString() != '0' ? '${controle.porcentGastosex(controle.gastosex).toStringAsFixed(1)}%' : '0',
                      radius: radius,
                      titleStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    );
                  default:
                    throw Error();
                }
              }),
            ),
          )),
        ),
      ),
    );
  }
}
