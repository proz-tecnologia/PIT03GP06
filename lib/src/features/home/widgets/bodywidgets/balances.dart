import 'package:ctrl_real/src/features/extension/extension_double.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/themes/darmodcontroller.dart';

class Balances extends StatefulWidget {

  const Balances({super.key});

  @override
  State<Balances> createState() => _BalancesState();
}

class _BalancesState extends State<Balances> {
  double incomingValue = 1000;

  double outcomingValeu = 300;

  double get total => incomingValue - outcomingValeu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: DarkController.instance.darkmod
                      ? const Color.fromARGB(213, 19, 19, 19)
                      : const Color.fromARGB(220, 104, 89, 205),
                  boxShadow: kElevationToShadow[0.8],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                width: MediaQuery.of(context).size.width,
                height: 32,
                child: const Center(
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: DarkController.instance.darkmod
                      ? const Color.fromARGB(213, 19, 19, 19)
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
                        children: const [
                          Text("Renda",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                          Text(
                            "  Disponível",
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          (incomingValue - outcomingValeu).formatBRL,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          outcomingValeu.formatBRL,
                          style: const TextStyle(
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
