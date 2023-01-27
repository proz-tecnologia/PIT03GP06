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

  registerUser(String email, String senha, String name, double renda2)  {
    repository.registerUser( email, senha,  renda2);
    repository.addUser(usuario, name, email, renda2);
    repository.addlvlfire(usuario);
    repository.addCategoriesPrimary(usuario);
    renda = renda2;
    _userlogin();
    notifyListeners();
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
      QuerySnapshot read = await repository.userRead(usuario: usuario);
      for (var element in read.docs) {
        name = element.get('name');
        email = element.get('email');
        renda = element.get('renda');
      }
      notifyListeners();
    }
  }
}
