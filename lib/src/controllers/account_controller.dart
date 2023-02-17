import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';

class AccountController extends ChangeNotifier {
  final AuthRepository _authRepository;

  AccountController(this._authRepository);

  Future<bool> deleteAccount() async {
    final result = await _authRepository.deleteUser();
    return result;
  }


  // Future<void> dialogBuilder(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Deseja mesmo excluir sua conta?'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Cancelar'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('Sim'),
  //             onPressed: () {
  //               deleteAccount();
  //               Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
