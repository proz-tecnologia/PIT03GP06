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
      animation: DarkContoller.instance,
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Crtl'Real",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: DarkContoller.instance.darkmod ? Brightness.dark : Brightness.light,
        ),
        initialRoute: "/",
        routes: {
          "/":(context) => HomePage(),
        },
      );
      },
    );
  }
}
