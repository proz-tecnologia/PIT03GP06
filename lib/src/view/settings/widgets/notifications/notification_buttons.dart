import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ctrl_real/src/controllers/notification_page_controller.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 94,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: Text(NotificationPageController.instance.isNotificationEnabled
              ? 'Desativar'
              : 'Ativar'),
          onPressed: () {
            NotificationPageController.instance.changeNotificationState();
            // NotificationPageController.instance.isNotificationEnabled = true;
            // NotificationPageController.instance.isSoundEnabled = true;
          },
        ),
    );
  }
}

class SoundButton extends StatelessWidget {
  const SoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationPageController>(
      builder: (context, value, child) => SizedBox(
        width: 94,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: Text(NotificationPageController.instance.isSoundEnabled
              ? 'Desativar'
              : 'Ativar'),
          onPressed: () {
            NotificationPageController.instance.changeSoundState();
            // NotificationPageController.instance.isNotificationEnabled = true;
            // NotificationPageController.instance.isSoundEnabled = true;
          },
        ),
      ),
    );
  }
}
