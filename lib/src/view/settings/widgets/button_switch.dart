import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ctrl_real/src/controllers/notifications/button_switch_controller.dart';

class SwitchButton extends StatelessWidget {
  SwitchButton({super.key});
  final _controller = ButtonSwitchController();

  //bool isSwitchEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Switch(
          activeColor: Colors.deepPurple,
          value: _controller.isNotificationEnabled,
          onChanged: _controller.changeNotificationState(),
        ),
        Opacity(
          opacity: _controller.isNotificationEnabled ? 0.4 : 1,
          child: Switch(
            activeColor: Colors.deepPurple,
            value: _controller.isSoundEnabled,
            onChanged: _controller.isNotificationEnabled ? null : _controller.changeSoundState(),
          ),
        ),
      ],
    );
  }
}

// class SwitchButton extends StatelessWidget {
//   final VoidCallback valueTest;
//   final bool valueDois;
//   const SwitchButton(this.valueTest, this.valueDois, {super.key});
//
//   //bool isSwitchEnabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Switch(
//         // This bool value toggles the switch.
//         value: valueDois,
//         activeColor: Colors.deepPurple,
//         onChanged: (bool value){
//           valueTest;
//         },
//       );
//   }
// }
