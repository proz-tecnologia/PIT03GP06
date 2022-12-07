import 'package:ctrl_real/src/controllers/providercontrolers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes/themes_buttom.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerCuston extends StatelessWidget {
  const DrawerCuston({super.key});

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
            children: const <Widget>[
              ListTile(
                title: Text(Strings.nameThemesDarkDrawer),
                trailing: ButtonDark(),
              ),
              ListTile(
                title: Text('Blue'),
                trailing: ButtonBlue(),
              ),
              ListTile(
                title: Text('Green'),
                trailing: ButtonGreen(),
              ),
              ListTile(
                title: Text('Red'),
                trailing: ButtonRed(),
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
