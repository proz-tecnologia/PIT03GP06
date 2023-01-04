import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/home/widgets/indicatorpichart.dart';
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
    return Consumer<HistoryController>(
      builder: (context, value, child) => Row(
        children: [
          value.registersList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 32, left: 12),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Consumer<HistoryController>(
                      builder: (context, controle, __) => (PieChart(
                        PieChartData(
                          centerSpaceRadius: 26,
                          sections: List.generate(1, (i) {
                            const fontSize = 12.0;
                            const radius = 42.0;
                            switch (i) {
                              case 0:
                                return PieChartSectionData(
                                  color: Colors.white,
                                  value: 100,
                                  title: 'Vazio',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: darkFunctionTexts(),
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
                )
              : loadGrafico(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: supermercColorIndicator(),
                text: 'Supermercado',
                isSquare: true,
              ),
              Indicator(
                color: transporColorIndicator(),
                text: 'Transporte',
                isSquare: true,
              ),
              Indicator(
                color: pagColorIndicator(),
                text: 'Pagamentos',
                isSquare: true,
              ),
              Indicator(
                color: lazerColorIndicator(),
                text: 'Lazer',
                isSquare: true,
              ),
              Indicator(
                color: farmacColorIndicator(),
                text: 'Farmácia',
                isSquare: true,
              ),
              Indicator(
                color: gastosexColorIndicator(),
                text: 'Gastos extras',
                isSquare: true,
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ],
      ),
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
                      color: supermercColorIndicator(),
                      value: controle.supermerc != 0 ? controle.supermerc : 1,
                      title: controle.supermerc.toString() != '0'
                          ? '${controle.porcentSupermerc(controle.supermerc).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 1:
                    return PieChartSectionData(
                      color: transporColorIndicator(),
                      value: controle.transpor != 0 ? controle.transpor : 1,
                      title: controle.transpor.toString() != '0'
                          ? '${controle.porcentTranspor(controle.transpor).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 2:
                    return PieChartSectionData(
                      color: pagColorIndicator(),
                      value: controle.pagament != 0 ? controle.pagament : 1,
                      title: controle.pagament.toString() != '0'
                          ? '${controle.porcentPagament(controle.pagament).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 3:
                    return PieChartSectionData(
                      color: lazerColorIndicator(),
                      value: controle.lazer != 0 ? controle.lazer : 1,
                      title: controle.lazer.toString() != '0'
                          ? '${controle.porcentLazer(controle.lazer).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 4:
                    return PieChartSectionData(
                      color: farmacColorIndicator(),
                      value: controle.pagament != 0 ? controle.farmac : 1,
                      title: controle.farmac.toString() != '0'
                          ? '${controle.porcentFarmac(controle.farmac).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    );
                  case 5:
                    return PieChartSectionData(
                      color: gastosexColorIndicator(),
                      value: controle.gastosex != 0 ? controle.gastosex : 1,
                      title: controle.gastosex.toString() != '0'
                          ? '${controle.porcentGastosex(controle.gastosex).toStringAsFixed(1)}%'
                          : '',
                      radius: radius,
                      titleStyle: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
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
