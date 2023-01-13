import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/main.dart';
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
      isloading = false;
      notifyListeners();
    });
  }

  _userlogin() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registerUser(String email, String senha, String name, double renda2) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      addUser(name, email, renda2);
      addlvlfire();
      addCategoriesPrimary();
      renda = renda2;
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
        throw ExceptionUsers("Olgo deu errado!");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil("/", ModalRoute.withName('/home'));
    _userlogin();
  }

  Future<void> addUser(String name, String email, double renda2) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .set({"name": name, "email": email, "renda": renda2});
    notifyListeners();
  }

  Future<void> updateNameUser(String name2) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .update({"name": name2});
    name = name2;
    notifyListeners();
  }

  updateEmailUser(String email2) async {
    String id = "userid";
    await usuario!.updateEmail(email2);
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .update({"email": email2});
    email = email2;
    notifyListeners();
  }

  updateSenhaUser(String senha2) async {
    await usuario!.updatePassword(senha2);
    notifyListeners();
  }

  Future<void> userRead() async {
    if (usuario != null) {
      QuerySnapshot read =
          await datb.collection('usuarios/${usuario!.uid}/user').get();
      for (var element in read.docs) {
        name = element.get('name');
        email = element.get('email');
        renda = element.get('renda');
      }
      notifyListeners();
    }
  }

  Future<void> addCategoriesPrimary() async {
    double supermercado = 0;
    double lazer = 0;
    double transporte = 0;
    double farmacia = 0;
    double pagamentos = 0;
    double gastosex = 0;
    double saida = 0;
    String id = 'categoriesid';
    await datb.collection("usuarios/${usuario!.uid}/categories").doc(id).set({
      'saida': saida,
      'supermercado': supermercado,
      'lazer': lazer,
      'transporte': transporte,
      'farmacia': farmacia,
      'pagamentos': pagamentos,
      'gastosex': gastosex,
    });
  }

  Future<void> addlvlfire() async {
    int date = DateTime.now().day;
    String id = 'nivelsystem';
    await datb
        .collection("usuarios/${usuario!.uid}/nivel")
        .doc(id)
        .set({'xp': 0, 'finalxp': 100, 'lvl': 1, 'xpusers': 0, 'dayxp': date});
  }
}
