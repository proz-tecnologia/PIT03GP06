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
          },
        ),
      ),
    );
  }
}


class FrequencyButton extends StatelessWidget {
  final frequencyValue = ValueNotifier('');
  final frequencyOptions = ['01', '02', '03'];

  FrequencyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 94,

      child: ValueListenableBuilder(
          valueListenable: frequencyValue,
          builder: (BuildContext context, String value, _) {
            return DropdownButton<String>(
              hint: const Text('Selecionar'),
              //dropdownColor: Colors.deepPurple,
              value: (value.isEmpty) ? null : value,
              onChanged: (option) => frequencyValue.value = option.toString(),
              items: frequencyOptions
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            );
          }),
    );
  }
}
