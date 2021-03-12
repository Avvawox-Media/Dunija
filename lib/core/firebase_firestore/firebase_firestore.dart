import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CloudFirestoreHelp {
  FirebaseFirestore firestoreInstance;

  CloudFirestoreHelp instance = CloudFirestoreHelp._instance();

  CloudFirestoreHelp._instance() {
    initFirebase();
  }

  void initFirebase() async {
    final firebase = await Firebase.initializeApp();
    //
    firestoreInstance = FirebaseFirestore.instance;

    final users = firestoreInstance.collection('users');
    final recipe = firestoreInstance.collection('recipe');
  }
}
