import 'package:health_predictor/services/auth.dart';
import 'package:health_predictor/wrapper/Wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome. setEnabledSystemUIOverlays([]);
  //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  await Firebase.initializeApp();
  runApp(StreamProvider<User?>.value(
    value: AuthService().user,
    initialData: FirebaseAuth.instance.currentUser,
    child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title:"HoPE",
        color: Colors.white,
        home:Wrapper()),
  ));
}

