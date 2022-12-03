import 'dart:io';
import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  File? perfilImage;

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Gerenciar perfil"),
        ),
        body: Column(children: [
          Container(
            color: const Color.fromARGB(94, 104, 89, 205),
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
                      ),
                      const Icon(
                        Icons.photo_library_sharp,
                        color: Color.fromARGB(255, 104, 89, 205),
                        size: 20,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      color: const Color.fromARGB(33, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.photo_camera,
                                          size: 60,
                                        ),
                                        onPressed: () {
                                          cameraImage();
                                        },
                                      ),
                                    ),
                                    const Text('Camera')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      color: const Color.fromARGB(33, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.photo,
                                          size: 60,
                                        ),
                                        onPressed: () {
                                          galeryImage();
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
                const Text("@kawaii_Aysha"),
                const Text("Nome completo de Aysha"),
                const Text("Level 5"),
              ],
            ),
          ),
          ListTile(
            title: const Text("E-mail"),
            subtitle: const Text("user@mail.com"),
            trailing: const Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Senha"),
            subtitle: const Text("***********"),
            trailing: const Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Nome"),
            subtitle: const Text("Kawaii_Aysha"),
            trailing: const Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Deletar conta"),
            trailing: const Icon(Icons.delete),
            onTap: () {},
          )
        ]),
      ),
    );
  }

  galeryImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (temporaryImage != null) {
      setState(() {
        perfilImage = File(temporaryImage.path);
      });
    }
  }

  cameraImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      setState(() {
        perfilImage = File(temporaryImage.path);
      });
    }
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
