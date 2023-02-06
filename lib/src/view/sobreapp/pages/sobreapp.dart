import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkFunctionWidgets(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sobre'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 112),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 17),
                  width: 150,
                  height: 158,
                  child: Image.asset('asset/img/iconelogin.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 11),
                  child: Text(
                    '1.0',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karma(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.4525,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                  constraints: const BoxConstraints(
                    maxWidth: 108,
                  ),
                  child: Text(
                    'Desenvolvido por Angelina Ottoni, Janiele Justino, Júlia Lucena & Paulo César',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karma(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4525,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
