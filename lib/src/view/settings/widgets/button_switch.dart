import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ctrl_real/src/controllers/notifications/button_switch_controller.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});
  //final _controller = ButtonSwitchController();

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  final controller = ButtonSwitchController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      builder: (context, child) => ListView(
        children: [
          Switch(
            activeColor: Colors.deepPurple,
            value: controller.isNotificationEnabled,
            onChanged: controller.changeNotificationState(),
          ),
          Opacity(
            opacity: controller.isNotificationEnabled ? 0.4 : 1,
            child: Switch(
              activeColor: Colors.deepPurple,
              value: controller.isSoundEnabled,
              onChanged: controller.isNotificationEnabled
                  ? null
                  : controller.changeSoundState(),
            ),
          ),
        ],
      ),
    );
  }
}
