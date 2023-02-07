import 'dart:io';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/repositories/firestore_repository.dart';
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
        body: Column(
          children: [
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
              padding: const EdgeInsets.only(top: 90),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Colors.redAccent,
                  )
                ),
                child: const Text(
                  'Excluir conta',
                  style:
                      TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
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
