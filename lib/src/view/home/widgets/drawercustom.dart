import 'package:ctrl_real/src/controllers/themes/themes_buttom.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerCuston extends StatefulWidget {
  const DrawerCuston({super.key});

  @override
  State<DrawerCuston> createState() => _DrawerCustonState();
}

class _DrawerCustonState extends State<DrawerCuston> {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 268,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: darkFunctionWidgets(),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/perfil');
                      },
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: const Color.fromARGB(140, 255, 255, 255),
                              height: 100,
                              width: 100,
                              child: const Icon(
                                Icons.person_outline,
                                size: 40,
                                color: Color.fromARGB(129, 0, 0, 0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Consumer<UsersService>(builder: (context, value, child) => Center(
                      child: Text(value.name ?? "", style: const TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          ),
          ExpansionTile(
            textColor: darkFunctionSelected(),
            iconColor: darkFunctionSelected(),
            leading: const Icon(Icons.color_lens),
            title: const Text(Strings.nameThemesDrawer),
            children: <Widget>[
              const ListTile(
                title: Text(Strings.nameThemesDarkDrawer),
                trailing: ButtonDark(),
              ),
              const ListTile(
                title: Text('Céu'),
                trailing: ButtonBlue(),
              ),
              const ListTile(
                title: Text('Money'),
                trailing: ButtonGreen(),
              ),
              const ListTile(
                title: Text('Natal'),
                trailing: ButtonRed(),
              ),
              ListTile(
                  title: const Text(
                    'Mais temas',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/editthemes")),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(Strings.nameConfigDrawer),
            onTap: () {
              Navigator.of(context).pushNamed('/config');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text(Strings.nameSobreAppDrawer),
            onTap: () {
              Navigator.of(context).pushNamed('/sobreapp');
              debugPrint(_firebaseAuth.currentUser!.displayName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(Strings.nameExitDrawer),
            onTap: () {
              context.read<UsersService>().logout();
            },
          ),
        ],
      ),
    );
  }
}
