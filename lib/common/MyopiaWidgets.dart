import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/common/Colors_App.dart';

import 'Text_Styles.dart';

class MyopiaWidgets extends StatefulWidget {
  final String image;
  final String answer;
  final Function changeFilled;
  final Function saveMcqAnswers;

  MyopiaWidgets(
    this.image,
    this.answer,
    this.changeFilled,
    this.saveMcqAnswers,
  );

  @override
  _MyopiaWidgets createState() => _MyopiaWidgets(
        image,
        answer,
        changeFilled,
        saveMcqAnswers,
      );
}

class _MyopiaWidgets extends State<MyopiaWidgets> {
  String image;
  String answer;
  Function changeFilled;
  Color selected = AppTheme.blue;
  Color unselected = greyBG;
  List<String> userAnswers = [];
  Function saveMcqAnswers;
  ScrollController? scrollController;
  List options2 = [
    'Left number is more clear',
    'Right number is more clear',
    'Both are clear'
  ];
  String answer2 = "";
  _MyopiaWidgets(
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Style styles = new Style(height);
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(
          bottom: height * 0.05,
          left: width * 0.06,
          right: width * 0.06,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.03),
              child: Image.asset(
                image,
                // height: height * 0.4,
                // width: height * 0.4,
              ),
            ),
           
            SizedBox(height: height * 0.02),
            
          ],
        ),
      ),
    );
  }
}
