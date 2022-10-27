import 'package:ctrl_real/src/features/home/widgets/piechart.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/themes/darmodcontroller.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 2, right: 2),
      child: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (BuildContext context, Widget? child) {
          return Column(
          children: [
            Container(
              decoration: BoxDecoration(
              color: DarkController.instance.darkmod ? const Color.fromARGB(213, 19, 19, 19) : const Color.fromARGB(220, 104, 89, 205),
              boxShadow: kElevationToShadow[0.8],
              borderRadius: BorderRadius.circular(4.0),
              ),
              width: MediaQuery.of(context).size.width,
              height: 32,
              child: 
                const Center(
                  child: Text(
                    "Categorias",
                    style: TextStyle(fontSize: 24, color:Color(0xdfffffff)),
                  )
                ),
              ),
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
              color: DarkController.instance.darkmod ? const Color.fromARGB(213, 19, 19, 19) : const Color.fromARGB(220, 104, 89, 205),
              boxShadow: kElevationToShadow[4],
              borderRadius: BorderRadius.circular(4.0),
              ),
              height: 152,
              width: MediaQuery.of(context).size.width,
              child: const PieChartSample2(),
              ),
            ],
          );
        }
      ),
    );
  }
}