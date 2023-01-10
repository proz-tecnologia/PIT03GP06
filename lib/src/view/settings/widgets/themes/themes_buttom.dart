import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonDark extends StatelessWidget {
  const ButtonDark({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text(DarkController.instance.darkmod ? 'Desativar' : 'Atitvar'),
        onPressed: () {
            DarkController.instance.changeTheme();
            DarkController.instance.bluemod = false;
            DarkController.instance.redmod = false;
            DarkController.instance.greenmod = false;
            Navigator.of(context).pushReplacementNamed("/home");
        },
      ),
    );
  }
}

class ButtonBlue extends StatelessWidget {
  const ButtonBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LvlSystem>(
      builder: (context, value, child) => SizedBox(
        width: 94,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 65, 105, 225)),
          onPressed: value.lvl >= 2
              ? () {
                  DarkController.instance.changeThemeBlue();
                  DarkController.instance.darkmod = false;
                  DarkController.instance.redmod = false;
                  DarkController.instance.greenmod = false;
                  Navigator.of(context).pushReplacementNamed("/home");
                }
              : () {},
          child: value.lvl >= 2
              ? Text(DarkController.instance.bluemod ? 'Desativar' : 'Atitvar')
              : const Text('Nível 2'),
        ),
      ),
    );
  }
}

class ButtonGreen extends StatelessWidget {
  const ButtonGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LvlSystem>(
      builder: (context, value, child) => SizedBox(
        width: 94,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green),
          onPressed: value.lvl >= 10
              ? () {
                  DarkController.instance.changeThemeGreen();
                  DarkController.instance.darkmod = false;
                  DarkController.instance.bluemod = false;
                  DarkController.instance.redmod = false;
                  Navigator.of(context).pushReplacementNamed("/home");
                }
              : () {},
          child: value.lvl >= 10
              ? Text(DarkController.instance.greenmod ? 'Desativar' : 'Atitvar')
              : const Text('Nível 10'),
        ),
      ),
    );
  }
}

class ButtonRed extends StatelessWidget {
  const ButtonRed({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LvlSystem>(
      builder: (context, value, child) => SizedBox(
        width: 94,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(220, 219, 37, 27)),
          onPressed: value.lvl >= 15
              ? () {
                  DarkController.instance.changeThemeRed();
                  DarkController.instance.darkmod = false;
                  DarkController.instance.bluemod = false;
                  DarkController.instance.greenmod = false;
                  Navigator.of(context).pushReplacementNamed("/home");
                }
              : () {},
          child: value.lvl >= 15
              ? Text(DarkController.instance.redmod ? 'Desativar' : 'Atitvar')
              : const Text('Nível 15'),
        ),
      ),
    );
  }
}
