import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final FirebaseFirestore datb = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerUser(
      {required String email, required String senha}) async {
    try {
      var data = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      return data.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw ExceptionUsers(
            "E-mail já cadastrado, informe outro email ou recupere a senha.");
      }
    }
    return null;
  }

  Future<void> addUser(
      {required String uid,
      required String name,
      required String email,
      required double renda2}) async {
    String id = "userid";
    await datb
        .collection("usuarios/$uid/user")
        .doc(id)
        .set({"name": name, "email": email, "renda": renda2});
  }

  Future<void> addlvlfire(String uid) async {
    int date = DateTime.now().day;
    String id = 'nivelsystem';
    await datb
        .collection("usuarios/$uid/nivel")
        .doc(id)
        .set({'xp': 0, 'finalxp': 100, 'lvl': 1, 'xpusers': 0, 'dayxp': date});
  }

  Future<void> addCategoriesPrimary(String uid) async {
    double supermercado = 0;
    double lazer = 0;
    double transporte = 0;
    double farmacia = 0;
    double pagamentos = 0;
    double gastosex = 0;
    double saida = 0;
    String id = 'categoriesid';
    await datb.collection("usuarios/$uid/categories").doc(id).set({
      'saida': saida,
      'supermercado': supermercado,
      'lazer': lazer,
      'transporte': transporte,
      'farmacia': farmacia,
      'pagamentos': pagamentos,
      'gastosex': gastosex,
    });
  }

  User? userlogin() {
    return _auth.currentUser;
  }

  login({required String email, required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExceptionUsers("Usuário não encontrado!");
      } else if (e.code == 'wrong-password') {
        throw ExceptionUsers("Algo deu errado!");
      }
    }
  }

  reset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateNameUser(User? usuario, String name2) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .update({"name": name2});
  }

  updateEmailUser(User? usuario, String email2) async {
    String id = "userid";
    await usuario!.updateEmail(email2);
    await datb
        .collection("usuarios/${usuario.uid}/user")
        .doc(id)
        .update({"email": email2});
  }

  Future<List<Map<String, dynamic>>> userRead({
    User? usuario,
  }) async {
    List<Map<String, dynamic>> list = [];
    QuerySnapshot read =
        await datb.collection('usuarios/${usuario!.uid}/user').get();

    for (var doc in read.docs) {
      list.add(doc.data() as Map<String, dynamic>);
    }
    return list;
  }
}
