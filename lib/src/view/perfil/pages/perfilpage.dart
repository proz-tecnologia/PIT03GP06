import 'dart:io';
import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final UsersService userr = UsersService();
  File? perfilImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Perfil"),
        ),
        body: Consumer<UsersService>(
          builder: (context, value, child) => Column(children: [
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
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                              height: 160,
                              width: 160,
                              color: const Color.fromARGB(140, 255, 255, 255),
                              child: value.usuario!.photoURL == null &&
                                      value.perfilImage == null
                                  ? const Icon(
                                      Icons.person_outline,
                                      size: 60,
                                      color: Color.fromARGB(129, 0, 0, 0),
                                    )
                                  : value.usuario!.photoURL != null &&
                                          value.perfilImage != null
                                      ? Image.file(value.perfilImage!)
                                      : Image.network(value.usuario!.photoURL!),
                            )),
                        const Icon(
                          Icons.photo_library_sharp,
                          color: Colors.white,
                          size: 26,
                        )
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            color: DarkController.instance.darkmod
                                ? const Color.fromARGB(181, 19, 19, 19)
                                : const Color.fromARGB(162, 255, 255, 255),
                            height: 500,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 64,
                                        width: 64,
                                        color:
                                            const Color.fromARGB(33, 0, 0, 0),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.photo_camera,
                                            size: 40,
                                          ),
                                          onPressed: () {
                                            value.cameraImage();
                                          },
                                        ),
                                      ),
                                      const Text('Camera')
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 64,
                                        width: 64,
                                        color:
                                            const Color.fromARGB(33, 0, 0, 0),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.photo,
                                            size: 40,
                                          ),
                                          onPressed: () {
                                            value.galeryImage();
                                          },
                                        ),
                                      ),
                                      const Text('Galeria')
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Consumer<UsersService>(
                    builder: (context, value, child) => Text(
                      value.name ?? "",
                      style: const TextStyle(color: Colors.white),
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
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Nível',
                      style: TextStyle(fontSize: 40),
                    ),
                    Consumer<LvlSystem>(
                      builder: (context, value, child) => Text(
                        value.lvl.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
