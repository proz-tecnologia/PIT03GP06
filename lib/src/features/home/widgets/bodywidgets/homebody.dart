import 'package:ctrl_real/src/features/home/widgets/bodywidgets/balances.dart';
import 'package:ctrl_real/src/features/home/widgets/bodywidgets/categories.dart';
import 'package:ctrl_real/src/features/home/widgets/bodywidgets/spending.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: 653,
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 16),
            Balances(),
            SizedBox(height: 14),
            Categories(),
            SizedBox(height: 14),
            Speding(),
            SizedBox(height: 14),
          ],
        ),
      ),
    ));
  }
}
