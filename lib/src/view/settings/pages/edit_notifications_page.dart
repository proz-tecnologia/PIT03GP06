import 'package:flutter/material.dart';
import 'package:ctrl_real/src/view/settings/widgets/notifications/notification_buttons.dart';

class EditNotificationsPage extends StatelessWidget {
  const EditNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar notificações'),
        centerTitle: true,
      ),
      body: ListView(children: [
        const ListTile(
            title: Text('Receber notificações'),
            trailing: NotificationButton()),
        const ListTile(title: Text('Habilitar som'), trailing: SoundButton()),
        ListTile(
          title: const Text('Frequência diária'),
          trailing: FrequencyButton(),
        )
      ]),
    );
  }
}
