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
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(220, 104, 89, 205),
            ),
            accountEmail: Text("user@mail.com"),
            accountName: Text("Aysha"),
            currentAccountPicture: CircleAvatar(
              child: Text("AY"),
            ),
          ),
          const ExpansionTile(
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
            onTap: () {},
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
