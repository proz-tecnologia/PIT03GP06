import 'dart:io';

import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ExceptionUsers implements Exception {
  String message;

  ExceptionUsers(this.message);
}

class UsersService extends ChangeNotifier {
  final storage = FirebaseStorage.instance;
  AuthRepository repository = AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ImagePicker imagePicker = ImagePicker();

  User? usuario;
  bool isloading = true;
  String? name;
  String? email;
  double renda = 0;
  double? valorLimite;
  File? photoUrl;
  File? perfilImage;

  UsersService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
    });
    isloading = false;
    notifyListeners();
  }

  _userlogin() {
    usuario = repository.userlogin();
    notifyListeners();
  }

  registerUser(String email, String senha, String name, double renda2) async {
    var uid = await repository.registerUser(email: email, senha: senha);
    await repository.addUser(
        uid: uid ?? '', name: name, email: email, renda2: renda2);
    await repository.addlvlfire(uid ?? '');
    await repository.addCategoriesPrimary(uid ?? '');
    renda = renda2;
    await _userlogin();
  }

  login(String email, String senha) async {
    await repository.login(email: email, senha: senha);
    await userRead();
    _userlogin();
  }

  reset(String email) async {
    repository.reset(email);
  }

  logout() async {
    await _auth.signOut();
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil("/", ModalRoute.withName('/home'));
    _userlogin();
  }

  Future<void> updateNameUser(String name2) async {
    repository.updateNameUser(usuario, name2);
    name = name2;
    notifyListeners();
  }

  updateEmailUser(String email2) async {
    repository.updateEmailUser(usuario, email2);
    email = email2;
    notifyListeners();
  }

  updateSenhaUser(String senha2) async {
    await usuario!.updatePassword(senha2);
    notifyListeners();
  }

  Future<void> userRead() async {
    if (usuario != null) {
      List<Map<String, dynamic>> read =
          await repository.userRead(usuario: usuario);
      for (var element in read) {
        name = element['name'];
        email = element['email'];
        renda = element['renda'];
      }
      notifyListeners();
    }
  }

  galeryImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (temporaryImage != null) {
      perfilImage = File(temporaryImage.path);

      uploadFile();
      notifyListeners();
    }
  }

  cameraImage() async {
    final XFile? temporaryImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      perfilImage = File(temporaryImage.path);
      uploadFile();
      notifyListeners();
    }
  }

  Future<void> uploadFile() async {
    if (perfilImage == null) return;
    final fileName = basename(perfilImage!.path);
    final destination = 'files/${usuario!.uid}';
    try {
      final ref = storage.ref(destination).child(fileName);
      await ref.putFile(perfilImage!);
      String image = await ref.getDownloadURL();
      //userr.image(perfilImage!);
      //userr.addImage(image);
      usuario!.updatePhotoURL(image);
      //user.imageReadd(image);
    } catch (e) {
      return;
    }
  }
}
