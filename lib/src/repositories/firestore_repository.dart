import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

final TransactionsController controller =
    TransactionsController(authentinc: UsersService());

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

  Future<void> addValueCategory(
      double result, String categorynames, User? usuario) async {
    String id = 'categoriesid';
    if (categorynames == 'Supermercado') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'supermercado': controller.supermerc + result,
      });
    } else if (categorynames == 'Lazer') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'lazer': controller.lazer + result,
      });
    } else if (categorynames == 'Transporte') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'transporte': controller.transpor + result,
      });
    } else if (categorynames == 'Farmacia') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'farmacia': controller.farmac + result,
      });
    } else if (categorynames == 'Pagamentos') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'pagamentos': controller.pagament + result,
      });
    } else {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'gastosex': controller.gastosex + result,
      });
    }
  }

  Future<QuerySnapshot> chartRead(User? usuario) async {
    QuerySnapshot read =
        await datb.collection('usuarios/${usuario!.uid}/categories').get();
    return read;
  }

  Future<QuerySnapshot> transactionsread(User? usuario) async {
    QuerySnapshot read =
        await datb.collection('usuarios/${usuario!.uid}/transacoes').get();
    return read;
  }

  Future<void> removeByID(String id, User? usuario) async {
    await datb
        .collection("usuarios/${usuario!.uid}/transacoes")
        .doc(id)
        .delete();
  }

  Future<void> addsaidafire(double result, User? usuario) async {
    String id = 'categoriesid';
    await datb
        .collection("usuarios/${usuario!.uid}/categories")
        .doc(id)
        .update({
      'saida': controller.saida + result,
    });
  }

  Future<void> menosValueCategory(
      double result, String categorynames, User? usuario) async {
    String id = 'categoriesid';
    if (categorynames == 'Supermercado') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'supermercado': controller.supermerc - result,
        'saida': controller.saida - result
      });
    } else if (categorynames == 'Lazer') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'lazer': controller.lazer - result,
        'saida': controller.saida - result
      });
    } else if (categorynames == 'Transporte') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'transporte': controller.transpor -= result,
        'saida': controller.saida - result
      });
    } else if (categorynames == 'Farmacia') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'farmacia': controller.farmac -= result,
        'saida': controller.saida - result
      });
    } else if (categorynames == 'Pagamentos') {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'pagamentos': controller.pagament -= result,
        'saida': controller.saida - result
      });
    } else {
      await datb
          .collection("usuarios/${usuario!.uid}/categories")
          .doc(id)
          .update({
        'gastosex': controller.gastosex -= result,
        'saida': controller.saida - result
      });
    }
  }
}
