import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/xplvl_system_controller.dart';
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
  double supermerc = 0;
  double lazer = 0;
  double transpor = 0;
  double gastosex = 0;
  double pagament = 0;
  double farmac = 0;
  int datefirst = DateTime.now().day;
  int xpusers = 0;
  int xp = 0;
  int finalxp = 100;
  int lvl = 1;

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
      addlvlfire();
      addCategoriesPrimary();
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
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil("/", ModalRoute.withName('/home'));
    _userlogin();
  }

  Future<void> addUser(String name, String email) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .set({"name": name, "email": email});
    notifyListeners();
  }

  Future<void> userRead() async {
    if (usuario != null) {
      QuerySnapshot read =
          await datb.collection('usuarios/${usuario!.uid}/user').get();
      for (var element in read.docs) {
        name = element.get('name');
        email = element.get('email');
      }
    }
    notifyListeners();
  }

  Future<void> addCategoriesPrimary() async {
    String id = 'categoriesid';
    await datb.collection("usuarios/${usuario!.uid}/categories").doc(id).set({
      'supermercado': supermerc,
      'lazer': lazer,
      'transporte': transpor,
      'farmacia': farmac,
      'pagamentos': pagament,
      'gastosex': gastosex,
    });
  }

  Future<void> addlvlfire() async {
    String id = 'nivelsystem';
    await datb.collection("usuarios/${usuario!.uid}/nivel").doc(id).set({
      'xp': xp,
      'finalxp': finalxp,
      'lvl': lvl,
      'xpusers': xpusers,
      'dayxp': datefirst
    });
  }
}
