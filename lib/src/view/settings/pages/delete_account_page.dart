import 'dart:io';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  File? perfilImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Excluir conta"),
        ),
        body: Column(children: [
          Container(
            color: darkFunctionWidgets(),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          height: 120,
                          width: 120,
                          color: const Color.fromARGB(140, 255, 255, 255),
                          child: imageFunction(),
                        ),
                      )
                    ],
                  ),
                ),
                Consumer<UsersService>(
                  builder: (context, value, child) => Text(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    value.name ?? "",
                  ),
                ),
                Consumer<UsersService>(
                  builder: (context, value, child) => Text(
                    value.email ?? "",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 50,
                width: 154,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  child: const Text('Exluir conta',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    Provider.of(context).showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Deseja mesmo excluir sua conta?',style: TextStyle(color: darkFunctionTexts()),),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar',style: TextStyle(color: darkFunctionTexts())),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<TransactionsController>(context, listen: false).removeByID('id');
                              Navigator.of(context).pop();
                            },
                            child:  Text('Sim', style: TextStyle(color: darkFunctionTexts())),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ),),
        ]),
      ),
    );
  }

  Widget imageFunction() {
    if (perfilImage == null) {
      return const Icon(
        Icons.person_outline,
        size: 60,
        color: Color.fromARGB(129, 0, 0, 0),
      );
    } else {
      return Image.file(perfilImage!);
    }
  }
}
