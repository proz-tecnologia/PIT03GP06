import 'package:flutter/material.dart';
import '../../../../controllers/themes/darmodcontroller.dart';

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
              decoration: BoxDecoration(
              color: DarkController.instance.darkmod ? const Color.fromARGB(240, 30, 30, 30) : const Color.fromARGB(220, 104, 89, 205),
              boxShadow: kElevationToShadow[0.8],
              borderRadius: BorderRadius.circular(4.0),
              ),
            width: MediaQuery.of(context).size.width,
            height: 32,
            ),
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
              color: DarkController.instance.darkmod ? const Color.fromARGB(240, 30, 30, 30) : const Color.fromARGB(220, 104, 89, 205),
              boxShadow: kElevationToShadow[4],
              borderRadius: BorderRadius.circular(4.0),
              ),
            height: 148,
            width: MediaQuery.of(context).size.width,
            ),
          ],
        );
        }
      ),
    );
  }
}