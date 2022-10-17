import 'package:flutter/material.dart';

import '../../controllers/themes/darmodcontroller.dart';

class Balances extends StatelessWidget {
  const Balances({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (BuildContext context, Widget? child) {
          return  Column(
          children: [
            Container(
            color: DarkController.instance.darkmod ? const Color.fromARGB(100, 10, 10, 10) : const Color.fromARGB(220, 104, 89, 205),
            width: MediaQuery.of(context).size.width,
            height: 28,
            ),
            const SizedBox(height: 2),
            Container(
            color: DarkController.instance.darkmod ? const Color.fromARGB(100, 10, 10, 10) : const Color.fromARGB(220, 104, 89, 205),
            height: 142,
            width: MediaQuery.of(context).size.width,
          ),
          ],
        );
        }
      ),
    );
  }
}