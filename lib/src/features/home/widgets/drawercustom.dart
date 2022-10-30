import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';

class DrawerCuston extends StatelessWidget {
  const DrawerCuston({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 268,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(220, 104, 89, 205),
            ),
            accountEmail: const Text("user@mail.com"),
            accountName: const Text("Aysha"),
            currentAccountPicture: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/perfil');
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      child: Text("AY"),
                    ),
                  ),
                  Icon(Icons.add , color: Colors.white,)
                ],
              ),
            ),
          ),
          const ExpansionTile(
            textColor: Color.fromARGB(220, 104, 89, 205),
            iconColor: Color.fromARGB(220, 104, 89, 205),
            leading: Icon(Icons.color_lens),
            title: Text('Temas'),
            children: <Widget>[
              ListTile(
                title: Text('Dark'),
                trailing: ButtonDark(),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.of(context).pushNamed('/config');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Sobre o app'),
            onTap: () {
              Navigator.of(context).pushNamed('/sobreapp');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
