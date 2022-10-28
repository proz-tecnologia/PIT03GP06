import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';

class ButtomReceitas extends StatefulWidget {
  const ButtomReceitas({super.key});

  @override
  State<ButtomReceitas> createState() => _ButtomReceitasState();
}

class _ButtomReceitasState extends State<ButtomReceitas> {
  double? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 52),
      child: SizedBox(
        height: 52,
        width: 52,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(220, 104, 89, 205),
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  child: Container(
                    color: DarkController.instance.darkmod
                        ? const Color.fromARGB(213, 19, 19, 19)
                        : const Color.fromARGB(207, 255, 255, 255),
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(180, 244, 67, 54)),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/despesas");
                              },
                              child: const Text('Despesa')),
                        ),
                        SizedBox(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/receitas");
                              },
                              child: const Text('Receitas')),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
