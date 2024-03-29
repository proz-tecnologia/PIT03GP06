import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text(Strings.nameConfigDrawer),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // Preferências
              width: double.infinity,
              child: Text(Strings.preferences,
                textAlign: TextAlign.center,
                style: GoogleFonts.karma(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 3.0,
                  color: darkFunctionTexts(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 4, 30, 195),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 128, 6),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          width: 21,
                          height: 24,
                          child: const Icon(
                            Icons.edit_notifications_outlined,
                          ),
                        ),
                        TextButton(
                          //notificações
                          child: Text(Strings.notifications,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: darkFunctionTexts(),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("/editnotifications");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 175, 21),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                          width: 21,
                          height: 24,
                          child: const Icon(Icons.palette_outlined),
                        ),
                        TextButton(
                          // temas
                          child: Text(Strings.nameThemesDrawer,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: darkFunctionTexts(),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/editthemes");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // usuario
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    width: double.infinity,
                    child: Text(Strings.user,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.karma(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.6275,
                        color: darkFunctionTexts(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 124, 7),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          width: 16,
                          height: 17,
                          child: const Icon(
                            Icons.edit_outlined,
                          ),
                        ),
                        TextButton(
                          // editar conta
                          child: Text(Strings.editAccount,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: darkFunctionTexts(),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/editcount");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 118, 0),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                          width: 17,
                          height: 21,
                          child: const Icon(
                            Icons.delete_outlined,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            // excluir conta
                            Strings.deleteAccount,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: darkFunctionTexts(),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/deleteaccount");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
