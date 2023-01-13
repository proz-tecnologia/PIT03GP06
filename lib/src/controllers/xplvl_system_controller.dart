import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/database/firestore_database.dart';
import 'package:flutter/material.dart';

class LvlSystem extends ChangeNotifier {
  LvlSystem({required this.authentinc}) {
    _initdataFire();
  }

  _initdataFire() async {
    await _firebaserepository();
  }

  _firebaserepository() {
    datb = FireStoreDb.get();
  }

  int datelate = DateTime.now().day;
  int datefirst = DateTime.now().day;
  int xpusers = 0;
  int xp = 0;
  int finalxp = 100;
  int lvl = 1;
  late FirebaseFirestore datb;
  late UsersService authentinc;
  String id = 'nivelsystem';

  Future<void> lvlRead() async {
    if (authentinc.usuario != null) {
      QuerySnapshot read = await datb
          .collection('usuarios/${authentinc.usuario!.uid}/nivel')
          .get();
      for (var element in read.docs) {
        xp = element.get('xp');
        finalxp = element.get('finalxp');
        lvl = element.get('lvl');
        xpusers = element.get('xpusers');
        datefirst = element.get('dayxp');
      }
      notifyListeners();
    }
    //notifyListeners();
  }

  Future<void> addlvlfire() async {
    await datb
        .collection("usuarios/${authentinc.usuario!.uid}/nivel")
        .doc(id)
        .set({
      'xp': xp,
      'finalxp': finalxp,
      'lvl': lvl,
      'xpusers': xpusers,
      'dayxp': datefirst
    });
  }

  Future<void> despXpAdd() async {
    if (datefirst <= datelate) {
      if (xpusers < 5) {
        xpusers++;
        await datb
            .collection("usuarios/${authentinc.usuario!.uid}/nivel")
            .doc(id)
            .update({
          'xpusers': xpusers,
        });
        if (lvl == 15) {
          lvl = 15;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .set({
            'lvl': lvl,
          });
        } else {
          xp += 25;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({
            'xp': xp,
          });
        }
        if (xp >= finalxp) {
          lvl++;
          xp = xp - finalxp;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({'lvl': lvl, 'xp': xp});
        }
        if (xpusers == 5) {
          xpusers = 0;
          datefirst = datelate + 1;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({'xpusers': xpusers, 'dayxp': datefirst});
        }
      }
      notifyListeners();
    }
  }

  Future<void> recXpAdd() async {
    if (datefirst <= datelate) {
      if (xpusers < 5) {
        xpusers++;
        await datb
            .collection("usuarios/${authentinc.usuario!.uid}/nivel")
            .doc(id)
            .update({
          'xpusers': xpusers,
        });
        if (lvl == 15) {
          lvl = 15;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .set({
            'lvl': lvl,
          });
        } else {
          xp += 40;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({
            'xp': xp,
          });
        }
        if (xp >= finalxp) {
          lvl++;
          xp = xp - finalxp;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({'lvl': lvl, 'xp': xp});
        }
        if (xpusers == 5) {
          xpusers = 0;
          datefirst = datelate + 1;
          await datb
              .collection("usuarios/${authentinc.usuario!.uid}/nivel")
              .doc(id)
              .update({'xpusers': xpusers, 'dayxp': datefirst});
        }
      }
      notifyListeners();
    }
  }

  Future<void> xpFinal() async {
    if (lvl < 5) {
      finalxp = finalxp;
      await datb
          .collection("usuarios/${authentinc.usuario!.uid}/nivel")
          .doc(id)
          .update({
        'finalxp': finalxp,
      });
    } else if (lvl >= 5 && lvl <= 10) {
      finalxp = 150;
      await datb
          .collection("usuarios/${authentinc.usuario!.uid}/nivel")
          .doc(id)
          .update({
        'finalxp': finalxp,
      });
    } else {
      finalxp = 200;
      await datb
          .collection("usuarios/${authentinc.usuario!.uid}/nivel")
          .doc(id)
          .update({
        'finalxp': finalxp,
      });
    }
    notifyListeners();
  }
}
