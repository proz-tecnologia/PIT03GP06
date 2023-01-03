import 'package:ctrl_real/src/controllers/providercontrolers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes/themes_buttom.dart';
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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: darkFunctionWidgets(),
            ),
            accountName: const Text("Aysha"),
            accountEmail: Consumer<LvlSystem>(
                builder: (context, value, child) => value.lvl != 20
                    ? Text('${value.xp} / ${value.finalxp} Xp')
                    : const Text('Nível max')),
            currentAccountPicture: InkWell(
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
              exit();
            },
          ),
        ],
      ),
    );
  }

  exit() async {
    await _firebaseAuth
        .signOut()
        .then((user) => Navigator.of(context).pushNamed("/"));
  }
}
