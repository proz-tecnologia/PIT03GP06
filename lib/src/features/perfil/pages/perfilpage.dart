import 'dart:io';
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
                    galeryImage();
                  },
                ),
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Tire uma foto',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 104, 89, 205),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.photo_camera_rounded,
                        size: 20,
                        color: Color.fromARGB(255, 104, 89, 205),
                      )
                    ],
                  ),
                  onPressed: () => {
                    cameraImage(),
                  },
                ),
                const Text("@kawaii_Aysha"),
                const Text("Nome completo de Aysha"),
                const Text("Level 5"),
              ],
            ),
          ),
          ListTile(
            title: Text("E-mail"),
            subtitle: Text("user@mail.com"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: Text("Senha"),
            subtitle: Text("***********"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: Text("Nome"),
            subtitle: Text("Kawaii_Aysha"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: Text("Deletar conta"),
            trailing: Icon(Icons.delete),
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
      return Icon(
        Icons.person_outline,
        size: 60,
        color: Color.fromARGB(129, 0, 0, 0),
      );
    } else {
      return Image.file(perfilImage!);
    }
  }
}
