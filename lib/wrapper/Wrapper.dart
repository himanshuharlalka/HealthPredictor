
import 'package:health_predictor/UI/home_screen.dart';
import 'package:health_predictor/UI/navigationbase.dart';
import 'package:health_predictor/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_predictor/UI/signin.dart';
class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<User?>(context);

    if(user==null){
      return Signin();
    } else{
      return NavigationHomeScreen();
    }
  }

}