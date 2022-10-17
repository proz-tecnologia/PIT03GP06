import 'package:ctrl_real/pages/widgets/balances.dart';
import 'package:ctrl_real/pages/widgets/categories.dart';
import 'package:ctrl_real/pages/widgets/spending.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Expanded(child: SizedBox()),
          Balances(),
          Expanded(child: SizedBox()),
          Categories(),
          Expanded(child: SizedBox()),
          Speding(),
          Expanded(child: SizedBox()),
        ],
      )
    );
  }
}