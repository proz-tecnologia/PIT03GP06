import 'package:flutter/material.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:ctrl_real/src/view/settings/widgets/notifications/notification_buttons.dart';

class EditNotificationsPage extends StatelessWidget {
  const EditNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.editNotifications),
        centerTitle: true,
      ),
      body: ListView(children: [
        const ListTile(
            title: Text(Strings.receiveNotifications),
            trailing: NotificationButton()),
        const ListTile(
            title: Text(Strings.enableSound),
            trailing: SoundButton()),
        ListTile(
          title: const Text(Strings.dailyFrequency),
          trailing: FrequencyButton(),
        )
      ]),
    );
  }
}
