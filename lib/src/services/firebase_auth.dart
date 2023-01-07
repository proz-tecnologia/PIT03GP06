import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/model/usersmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionUsers implements Exception {
  String message;

  ExceptionUsers(this.message);
}

class UsersService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isloading = true;
  final FirebaseFirestore datb = FirebaseFirestore.instance;
  //String name = "";
  //String email = "";

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

  registerUser(String email, String senha, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
       addUser(name, email);
      _userlogin();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw ExceptionUsers(
            "E-mail já cadastrado, informe outro email ou recupere a senha.");
      }
    }
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

  Future<void> addUser(String name, String email) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .set({
          "name": name,
          "email": email 
        });
    notifyListeners();
  }
}
