import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? mUser = FirebaseAuth.instance.currentUser;
  Future<void> addDetails(Map<String, dynamic> map) {
    CollectionReference users = firestore.collection('users');
    print(map);
    print(map.runtimeType);
    return users.doc(mUser!.uid).update({
      'dob': map["dob"],
      'gender': map["gender"],
      'height': map["height"],
      'weight:': map["weight"],
      'bloodgroup': map["bloodgroup"],
      'ailments': map["ailments"],
    }).then((value) {
      print('success');
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<DocumentSnapshot> getDetails(String code) {
    DocumentReference room = firestore.collection('users').doc(mUser!.uid);
    return room.snapshots();
  }

  Future<bool> hasFilled() async {
    DocumentReference user = firestore.collection('users').doc(mUser!.uid);
    DocumentSnapshot? snapshot;
    await user.get().then((value) => snapshot = value);
    return (snapshot!.get('height').toString().isNotEmpty);
  }

  Future<int> getHeight() async {
    DocumentReference user = firestore.collection('users').doc(mUser!.uid);
    DocumentSnapshot? snapshot;
    await user.get().then((value) => snapshot = value);
    var height = int.parse((snapshot!.get('height').toString()));
    return height;
  }
}
