import 'package:flutter/material.dart';
import 'package:ctrl_real/src/view/settings/widgets/button_switch.dart';

class EditNotificationsPage extends StatelessWidget {
  const EditNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar notificações'),
        centerTitle: true,
      ),
      body: ListView(children: const [
          ListTile(
              title: Text('Receber notificações'),
              trailing: SwitchButton()),
          // const ListTile(
          //   title: Text('Frequência diária'),
          //   trailing:
          // ),
          ListTile(
              title: Text('Habilitar som'),
              trailing: SwitchButton()),
        ]),
      );
  }
}
