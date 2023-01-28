import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionUsers implements Exception {
  String message;

  ExceptionUsers(this.message);
}

class UsersService extends ChangeNotifier {
  AuthRepository repository = AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? usuario;
  bool isloading = true;
  String? name;
  String? email;
  double renda = 0;
  double? valorLimite;

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

<<<<<<< HEAD
  registerUser(String email, String senha, String name, double renda2)  {
    repository.registerUser( email, senha,  renda2);
    repository.addUser(usuario, name, email, renda2);
    repository.addlvlfire(usuario);
    repository.addCategoriesPrimary(usuario);
    renda = renda2;
    _userlogin();
    notifyListeners();
=======
  registerUser(String email, String senha, String name, double renda2) async {
    var uid = await repository.registerUser(email: email, senha: senha);
    await repository.addUser(
        uid: uid ?? '', name: name, email: email, renda2: renda2);
    await repository.addlvlfire(uid ?? '');
    await repository.addCategoriesPrimary(uid ?? '');
    renda = renda2;
    await _userlogin();
>>>>>>> ec05c2e6bae2d508cc4a6bafe17c87faafcbc8d2
  }

  login(String email, String senha)  {
     repository.login(email: email, senha: senha);
    _userlogin();
    notifyListeners();
  }

  reset(String email) async {
    repository.reset(email);
  }

  logout() async {
    await _auth.signOut();
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

   userRead() async {
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
}
