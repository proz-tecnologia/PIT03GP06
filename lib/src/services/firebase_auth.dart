import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionUsers {
  String message;

  ExceptionUsers(this.message);
}

class UsersService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isloading = true;

  UsersService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isloading = false;
      notifyListeners();
    });
  }

  _userlogin() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _userlogin();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExceptionUsers("Usuário não encontrado!");
      } else if (e.code == 'wrong-password') {
        throw ExceptionUsers("Senha invalida!");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _userlogin();
  }
}