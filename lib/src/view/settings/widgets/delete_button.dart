import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/account_controller.dart';
import '../../../repositories/auth_repository.dart';
import '../../../util/darkfunction.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountController>(
      builder: (context, controller, child) => OutlinedButton(
        onPressed: () => dialogBuilder(context),
        child: const Text('Excluir conta'),
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
        title: const Text('Deseja mesmo excluir sua conta?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              child: const Text('Sim'),
              onPressed: () {
                controller.deleteAccount();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
              }
          ),
        ],
      );
    },
  );
}
