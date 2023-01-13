import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/controllers/transactions_form_controller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Speding extends StatelessWidget {
  Speding({super.key});
  final TransactionController controller = TransactionController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[0.8],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  height: 32,
                  child: const Center(
                    child: Text(
                      Strings.nameLimitContainer,
                      style: TextStyle(fontSize: 24, color: Color(0xdfffffff)),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[4],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  height: 124,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      Consumer<TransactionsController>(
                        builder: (context, historyController, _) =>
                            historyController.saida == 0
                                ? const Text(
                                    'Ainda não houve gastos',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : historyController.saida > historyController.renda ? const Text(
                                    'Você ultrapassou seu limite!',
                                    style: TextStyle(color: Colors.white),
                                  ) : LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    animation: true,
                                    lineHeight: 30.0,
                                    animationDuration: 2500,
                                    percent: historyController
                                        .porcentSaida(controller.valor),
                                    center: Text(
                                      "${historyController.atualizarLimite(controller.valor).toStringAsFixed(1)} %",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    barRadius: const Radius.circular(16),
                                    progressColor:
                                        const Color.fromARGB(255, 63, 138, 224),
                                  ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                              'Esse é seu limite atual',
                              style:TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),

                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
