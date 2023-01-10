import 'package:flutter/material.dart';
import 'package:ctrl_real/src/view/settings/widgets/button_switch.dart';
import 'package:provider/provider.dart';

import '../../../controllers/notifications/button_switch_controller.dart';

class EditNotificationsPage extends StatelessWidget {
  const EditNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar notificações'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ButtonSwitchController>(
        create: (context) => ButtonSwitchController(),
        child: ListView(children: [
          ListTile(
              title: const Text('Receber notificações'),
              trailing: SwitchButton()),
          // const ListTile(
          //   title: Text('Frequência diária'),
          //   trailing:
          // ),
          ListTile(
              title: const Text('Habilitar som'),
              trailing: SwitchButton()),
        ]),
      ),
    );
  }
}
