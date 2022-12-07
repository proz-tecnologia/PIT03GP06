import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Configurações'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // preferncias
                width: double.infinity,
                child: Text(
                  'Preferências',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karma(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.6275,
                    color: const Color(0xff8b7fd1),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 4, 30, 194),
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
                            margin: const EdgeInsets.fromLTRB(0, 2, 3, 0),
                            width: 17,
                            height: 20,
                            child: const Icon(
                              Icons.edit_notifications_outlined,
                              // [Image url]
                              // fit:  BoxFit.cover,
                            ),
                          ),
                          Text(
                            // notificaes
                            'Notificações',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: const Color(0xff000000),
                            ),
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
                            child: Text(
                              'Temas',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karma(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4525,
                                color: const Color(0xff000000),
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
                      child: Text(
                        'Usuário',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.karma(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.6275,
                          color: const Color(0xff8b7fd1),
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
                            margin: const EdgeInsets.fromLTRB(0, 0, 4, 3),
                            width: 16,
                            height: 17,
                            child: const Icon(
                              Icons.edit_outlined,
                            ),
                          ),
                          TextButton(
                            // editar conta
                            child: Text(
                              'Editar conta',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karma(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 1.4525,
                                color: const Color(0xff000000),
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
                            margin: const EdgeInsets.fromLTRB(0, 2, 4, 0),
                            width: 17,
                            height: 21,
                            child: const Icon(
                              Icons.delete_outlined,
                            ),
                          ),
                          Text(
                            // excluirconta
                            'Excluir conta',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karma(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.4525,
                              color: const Color(0xff000000),
                            ),
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
      ),
    );
  }
}
