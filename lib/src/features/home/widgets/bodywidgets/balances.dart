import 'package:ctrl_real/src/features/extension/extension_double.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/themes/darmodcontroller.dart';

class Balances extends StatelessWidget {
  double incomingValue = 1000;
  double outcomingValeu = 300;

  double get total => incomingValue - outcomingValeu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 2, right: 2),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: DarkController.instance.darkmod
                      ? const Color.fromARGB(255, 9, 9, 9)
                      : const Color.fromARGB(220, 104, 89, 205),
                  boxShadow: kElevationToShadow[0.8],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                width: MediaQuery.of(context).size.width,
                height: 32,
                child: Center(
                  child: Text(
                    "Saldo",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xdfffffff),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: DarkController.instance.darkmod
                      ? const Color.fromARGB(255, 9, 9, 9)
                      : const Color.fromARGB(220, 104, 89, 205),
                  boxShadow: kElevationToShadow[4],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                height: 148,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Baseline(
                      baseline: 30,
                      baselineType: TextBaseline.alphabetic,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Entradas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                          Text(
                            "Disponível",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Saídas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          incomingValue.formatBRL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          (incomingValue - outcomingValeu).formatBRL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          outcomingValeu.formatBRL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
