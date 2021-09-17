import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/common/Colors_App.dart';

import 'Text_Styles.dart';

class MCQ extends StatefulWidget {
  final List<String> options;
  final String questions;
  final String image;
  final String answer;
  final Function changeFilled;
  final Function saveMcqAnswers;

  MCQ(
    this.options,
    this.questions,
    this.image,
    this.answer,
    this.changeFilled,
    this.saveMcqAnswers,
  );

  @override
  _MCQ createState() => _MCQ(
        options,
        questions,
        image,
        answer,
        changeFilled,
        saveMcqAnswers,
      );
}

class _MCQ extends State<MCQ> {
  List<String> options;
  String questions;
  String image;
  String answer;
  Function changeFilled;
  Color selected = AppTheme.blue;
  Color unselected = greyBG;
  List<String> userAnswers = [];
  Function saveMcqAnswers;

  _MCQ(
    this.options,
    this.questions,
    this.image,
    this.answer,
    this.changeFilled,
    this.saveMcqAnswers,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Style styles = new Style(height);
    return SingleChildScrollView(
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
              height: height * 0.3,
              margin: EdgeInsets.only(top: height * 0.03),
              child: Image.asset(
                image,
                // height: height * 0.4,
                // width: height * 0.4,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.012),
              child: Text(
                questions,
                style: TextStyle(
                  fontSize: height * 0.025,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.all(height * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: options[index] == answer ? selected : unselected,
                    ),
                    // height: height * 0.06,
                    child: Text(
                      options[index],
                      style: options[index] == answer
                          ? styles.getanswersWhiteTextStyle()
                          : styles.getanswersGreyTextStyle(),
                    ),
                  ),
                  onTap: () {
                    if (options[index] == answer) {
                      setState(() {
                        answer = '';
                        userAnswers.remove(options[index]);
                      });
                      changeFilled(false);
                      saveMcqAnswers('');
                    } else {
                      setState(() {
                        answer = options[index];
                      });
                      changeFilled(true);
                      saveMcqAnswers(answer);
                    }
                  },
                );
              },
              separatorBuilder: (context, item) {
                return SizedBox(height: height * 0.01);
              },
              itemCount: options.length,
            ),
          ],
        ),
      ),
    );
  }
}