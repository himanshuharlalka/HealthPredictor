import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/common/Colors_App.dart';
import 'package:health_predictor/services/firebaseHelper.dart';

import 'Text_Styles.dart';

class MyopiaWidgets extends StatefulWidget {
  final int height;
  final String image;
  final String answer;
  final Function changeFilled;
  final Function saveMcqAnswers;

  MyopiaWidgets(
    this.height,
    this.image,
    this.answer,
    this.changeFilled,
    this.saveMcqAnswers,
  );

  @override
  _MyopiaWidgets createState() => _MyopiaWidgets(
        height,
        image,
        answer,
        changeFilled,
        saveMcqAnswers,
      );
}

class _MyopiaWidgets extends State<MyopiaWidgets> {
  String image;
  String answer;
  int height;
  Function changeFilled;
  Color selected = AppTheme.blue;
  Color unselected = greyBG;
  List<String> userAnswers = [];
  Function saveMcqAnswers;
  ScrollController? scrollController;
  FireBaseHelper fireBaseHelper = new FireBaseHelper();
  User? user = FirebaseAuth.instance.currentUser;
  List options2 = [
    'Left number is more clear',
    'Right number is more clear',
    'Both are clear'
  ];
  String answer2 = "";
  _MyopiaWidgets(
    this.height,
    this.image,
    this.answer,
    this.changeFilled,
    this.saveMcqAnswers,
  );

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Style styles = new Style(height1);
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(
          bottom: height1 * 0.05,
          left: width * 0.06,
          right: width * 0.06,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height1 * 0.03),
              child: Image.asset(
                image,
                height: (235 * (height)) / (120 * 4.5),
                width: (235 * (height)) / (120 * 4.5),
              ),
            ),
            SizedBox(height: height1 * 0.02),
          ],
        ),
      ),
    );
  }
}
