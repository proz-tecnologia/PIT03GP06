import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDb {
  FireStoreDb._();
  static final FireStoreDb _instance = FireStoreDb._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get(){
    return FireStoreDb._instance._firestore;
  }
}