import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/util/strings.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sobre'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 24),
          width: double.infinity,
          color: const Color.fromARGB(220, 104, 89, 205),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                width: 150,
                height: 158,
                child: Image.asset('asset/img/icone5_1.png'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                child: const Text(
                  Strings.appName,
                  selectionColor: Color(0xff2fd82c),
                  //to do
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                child: const Text(
                  '1.0',
                  textAlign: TextAlign.center,
                  selectionColor: Color(0xffffffff),
                  //to do
                ),
              ),
              Container(
                margin:  const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child:
                const Text(
                  'Desenvolvido por...',
                  selectionColor: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
