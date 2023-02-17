import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/account_controller.dart';
import '../../../repositories/auth_repository.dart';
import '../../../util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountController>(
      builder: (context, controller, child) => SizedBox(
        width: 160,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
          onPressed: () => dialogBuilder(context),
          child: const Text(
            Strings.deleteAccount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

final controller = AccountController(AuthRepository());

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: darkFunctionWidgets(),
        title: const Text(
          Strings.delYourAccount,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              Strings.cancel,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              child: const Text(
                Strings.yes,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                controller.deleteAccount();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              }),
        ],
      );
    },
  );
}
