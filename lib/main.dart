import 'package:ctrl_real/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/pages/home/homepage.dart';
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
          canvasColor: DarkController.instance.darkmod ? const Color.fromARGB(240, 30, 30, 30) : const Color.fromARGB(216, 250, 250, 250),
          brightness: DarkController.instance.darkmod ? Brightness.dark : Brightness.light,
          appBarTheme: AppBarTheme(
            backgroundColor: DarkController.instance.darkmod ? const Color.fromARGB(50, 10, 10, 10) : const Color(0xff6959CD),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/":(context) => const HomePage(),
        },
      );
      },
    );
  }
}
