import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/view/home/pages/homepage.dart';
import 'package:ctrl_real/src/view/login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    UsersService auth = Provider.of<UsersService>(context);

    if (auth.isloading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginUser();
    } else {
      context.read<HistoryController>().transaction();
      context.read<HistoryController>().transactionsread();
      return const HomePage();
    }
  }

  loading() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
