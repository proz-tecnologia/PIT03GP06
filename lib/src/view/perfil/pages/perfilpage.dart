import 'dart:io';
import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  File? perfilImage;
  final storage = FirebaseStorage.instance;
  final UsersService user = UsersService();
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/perfil')),
          ),
          centerTitle: true,
          title: const Text("Perfil"),
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
                          child: Consumer<UsersService>(
                              builder: (context, value, child) =>
                                  Image.network(user.usuario!.photoURL!)),
                        ),
                      ),
                      const Icon(
                        Icons.photo_library_sharp,
                        color: Colors.white,
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
                                      height: 64,
                                      width: 64,
                                      color: const Color.fromARGB(33, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.photo_camera,
                                          size: 40,
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
                                      height: 64,
                                      width: 64,
                                      color: const Color.fromARGB(33, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.photo,
                                          size: 40,
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
    );
  }

  Future galeryImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (temporaryImage != null) {
      setState(() {
        perfilImage = File(temporaryImage.path);
        uploadFile();
      });
    }
  }

  Future cameraImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      setState(() {
        perfilImage = File(temporaryImage.path);
        uploadFile();
      });
    }
  }

  Future uploadFile() async {
    if (perfilImage == null) return;
    final fileName = basename(perfilImage!.path);
    final destination = 'files/${user.usuario!.uid}';
    try {
      final ref = storage.ref(destination).child(fileName);
      await ref.putFile(perfilImage!);
      String image = await ref.getDownloadURL();
      //user.addImage(image);
      //user.usuario!.updatePhotoURL(image);
      //user.imageReadd(image);
    } catch (e) {
      print('error occured');
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
