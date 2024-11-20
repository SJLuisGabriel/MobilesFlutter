import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseMovie {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference? collectionReference;

  DatabaseMovie() {
    collectionReference = firebaseFirestore.collection('movies');
  }

  Future<bool> insert(Map<String, dynamic> movies) async {
    try {
      collectionReference!.doc().set(movies);
    } catch (e) {
      kDebugMode ? print('Error al insertar: ${e.toString()}') : '';
    }
    return true;
  }

  Future<void> delete(String uid) async {
    return collectionReference!.doc(uid).delete();
  }

  Future<void> update(Map<String, dynamic> movies, String id) async {
    return collectionReference!.doc(id).update(movies);
  }

  Stream<QuerySnapshot> select() {
    return collectionReference!.snapshots();
  }
}
