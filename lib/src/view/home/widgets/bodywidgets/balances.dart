import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/extension/extension_double.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/themes_controller.dart';

class Balances extends StatefulWidget {
  const Balances({super.key});

  @override
  State<Balances> createState() => _BalancesState();
}

class _BalancesState extends State<Balances> {
  double renda = 5000;

  double saida = 0;

  double get saldoDisponivel => renda - saida;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Consumer<HistoryController>(
              builder: (context, value, child) => Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[0.8],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 32,
                  child: const Center(
                    child: Text(
                      Strings.nameBalancesContainer,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xdfffffff),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[4],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Renda total ${value.renda.formatBRL}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      Text(
                        "Gasto total ${value.saida.formatBRL}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Saldo total ${(value.renda - value.saida).formatBRL}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
