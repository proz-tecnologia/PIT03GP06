import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ctrl_real/src/controllers/notification_page_controller.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
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
        width: 104,
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
      width: 104,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        child: ValueListenableBuilder(
            valueListenable: frequencyValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_outlined,
                  color: Colors.white
                  ),
                  iconSize: 14,
                  hint: const Text(
                    'Selecione',
                    style: TextStyle(
                      fontSize: 14,
                      leadingDistribution: TextLeadingDistribution.proportional,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (option) =>
                      frequencyValue.value = option.toString(),
                  items: frequencyOptions
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                ),
              );
            }),
        onPressed: () {},
      ),
    );
  }
}
