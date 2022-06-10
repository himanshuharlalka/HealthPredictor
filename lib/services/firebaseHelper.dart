import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_predictor/model/user.dart';
import 'package:intl/intl.dart';

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
      'weight': map["weight"],
      'bloodgroup': map["bloodgroup"],
      'ailments': map["ailments"],
    }).then((value) {
      print('success');
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addResult(String result, int type) async {
    CollectionReference users = firestore.collection('users');
    DocumentReference user = firestore.collection('users').doc(mUser!.uid);
    DocumentSnapshot? snapshot;
    await user.get().then((value) => snapshot = value);
    String testName = (type == 1) ? 'cb' : 'myopia';
    var list = snapshot!.get(testName);
    print(list);
    print(list.runtimeType);
    String
    formattedDate =
    DateFormat(
        'dd-MM-yyyy')
        .format(
        DateTime.now());
    String toAdd = result +" " +formattedDate;
    list.add(toAdd);
    return users.doc(mUser!.uid).update({
      testName: list,
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

  Future<UserDetails> getUserDetails() async {
    DocumentReference user = firestore.collection('users').doc(mUser!.uid);
    DocumentSnapshot? snapshot;
    await user.get().then((value) => snapshot = value);
    UserDetails uD = new UserDetails();
    print(snapshot);
    uD.ailments = snapshot!.get('ailments');

    uD.dob = snapshot!.get('dob');
    uD.name = snapshot!.get('name');

    uD.weight = snapshot!.get('weight');
    print(uD.weight);
    uD.bloodgroup = snapshot!.get('bloodgroup');
    uD.height = snapshot!.get('height');
    uD.gender = snapshot!.get('gender');
    uD.myopia = snapshot!.get('myopia');
    uD.chd = snapshot!.get('chd');
    uD.pcod = snapshot!.get('pcod');
    uD.cb = snapshot!.get('cb');

    return uD;
  }
}
