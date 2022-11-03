import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';

class DrawerCuston extends StatelessWidget {
  const DrawerCuston({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 268,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(193, 104, 89, 205),
            ),
            accountName: Text("Aysha"),
            accountEmail: Text('30 / 150 Xp'),
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
                      child: const Icon(Icons.person_outline, size: 40, color: Color.fromARGB(129, 0, 0, 0),),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          const ExpansionTile(
            textColor: Color.fromARGB(220, 104, 89, 205),
            iconColor: Color.fromARGB(220, 104, 89, 205),
            leading: Icon(Icons.color_lens),
            title: Text(Strings.nameThemesDrawer),
            children: <Widget>[
              ListTile(
                title: Text(Strings.nameThemesDarkDrawer),
                trailing: ButtonDark(),
              ),
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
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(Strings.nameExitDrawer),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
