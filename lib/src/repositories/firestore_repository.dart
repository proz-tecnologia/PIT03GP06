import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRepository {
  final FirebaseFirestore datb = FirebaseFirestore.instance;

  Future<bool> addTotaltransection(
      TotalandCategory trans, User? usuario) async {
    try {
      await datb
          .collection("usuarios/${usuario!.uid}/transacoes")
          .doc(trans.id)
          .set(trans.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> supermercado(double result, String categorynames, User? usuario,
      double supermerc) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'supermercado': supermerc + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> lazer(
      double result, String categorynames, User? usuario, double lazer) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'lazer': lazer + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> transporte(double result, String categorynames, User? usuario,
      double transpor) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'transporte': transpor + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> farmacia(double result, String categorynames, User? usuario,
      double farmacia) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'farmacia': farmacia + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> pagamentos(double result, String categorynames, User? usuario,
      double pagament) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'pagamentos': pagament + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> gastosex(double result, String categorynames, User? usuario,
      double gastosex) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'gastosex': gastosex + result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menossupermercado(double result, String categorynames,
      User? usuario, double supermerc) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'supermercado': supermerc - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menoslazer(
      double result, String categorynames, User? usuario, double lazer) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'lazer': lazer - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menostransporte(double result, String categorynames,
      User? usuario, double transpor) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'transporte': transpor - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menosfarmacia(double result, String categorynames, User? usuario,
      double farmacia) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'farmacia': farmacia - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menospagamentos(double result, String categorynames,
      User? usuario, double pagament) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'pagamentos': pagament - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> menosgastosex(double result, String categorynames, User? usuario,
      double gastosex) async {
    try {
      String id = 'categoriesid';
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'gastosex': gastosex - result,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<QuerySnapshot?> chartRead(User? usuario) async {
    try {
      QuerySnapshot read =
          await datb.collection('usuarios/${usuario!.uid}/categories').get();
      return read;
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot?> transactionsread(User? usuario) async {
    try {
      QuerySnapshot read =
          await datb.collection('usuarios/${usuario!.uid}/transacoes').get();
      return read;
    } catch (e) {
      return null;
    }
  }

  Future<bool> removeByID(String id, User? usuario) async {
    try {
      await datb
          .collection("usuarios/${usuario!.uid}/transacoes")
          .doc(id)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
