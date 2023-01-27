import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseFirestore datb = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  registerUser(String email, String senha, double renda2) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw ExceptionUsers(
            "E-mail já cadastrado, informe outro email ou recupere a senha.");
      }
    }
  }

  Future<void> addUser(
    User? usuario,
      String name,
       String email,
       double renda2) async {
    String id = "userid";
    await datb
        .collection("usuarios/${usuario!.uid}/user")
        .doc(id)
        .set({"name": name, "email": email, "renda": renda2});
  }

  Future<void> addlvlfire(User? usuario) async {
    int date = DateTime.now().day;
    String id = 'nivelsystem';
    await datb
        .collection("usuarios/${usuario!.uid}/nivel")
        .doc(id)
        .set({'xp': 0, 'finalxp': 100, 'lvl': 1, 'xpusers': 0, 'dayxp': date});
  }

  Future<void> addCategoriesPrimary(User? usuario) async {
    double supermercado = 0;
    double lazer = 0;
    double transporte = 0;
    double farmacia = 0;
    double pagamentos = 0;
    double gastosex = 0;
    String id = 'categoriesid';
    await datb.collection("usuarios/${usuario!.uid}/categories").doc(id).set({
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
      print(e);
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

  Future<QuerySnapshot> userRead({
    User? usuario,
  }) async {
    QuerySnapshot read =
        await datb.collection('usuarios/${usuario!.uid}/user').get();
    return read;
  }
}
