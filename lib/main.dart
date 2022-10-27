import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/features/home/pages/homepage.dart';
import 'package:ctrl_real/src/features/settings/pages/settingspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DarkController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Crtl'Real",
          theme: ThemeData(
            canvasColor: DarkController.instance.darkmod
                ? const Color.fromARGB(255, 41, 41, 41)
                : const Color.fromARGB(216, 250, 250, 250),
            brightness: DarkController.instance.darkmod
                ? Brightness.dark
                : Brightness.light,
            appBarTheme: AppBarTheme(
              backgroundColor: DarkController.instance.darkmod
                  ? const Color.fromARGB(255, 34, 34, 34)
                  : const Color(0xff6959CD),
            ),
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => const HomePage(),
            "/config": (context) => const SettingsPage()
          },
        );
      },
    );
  }
}
