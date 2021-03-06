import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/common/Colors_App.dart';
import 'package:health_predictor/common/CommonWidgets.dart';
import 'package:health_predictor/common/Text_Styles.dart';

import '../app_theme.dart';
import '../services/firebaseHelper.dart';

class ColorBlindnessResult extends StatefulWidget {
  final List? answers;
  const ColorBlindnessResult({Key? key, required this.answers})
      : super(key: key);

  @override
  _ColorBlindnessResultState createState() => _ColorBlindnessResultState();
}

class _ColorBlindnessResultState extends State<ColorBlindnessResult> {
  List correctAnswers = [
    '12',
    '8',
    '6',
    '29',
    '57',
    '5',
    '3',
    '15',
    '74',
    '2',
    '6',
    '97',
    '45',
    '5',
    '7',
    '16',
    '73',
    'X',
    'X',
    '35',
    '96'
  ];
  List answerList = [];
  List strongDutan = [
    '12',
    '3',
    '5',
    '70',
    '35',
    '2',
    '5',
    '17',
    '21',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    '5',
    '2',
    '3',
    '9'
  ];
  List mildDutan = [
    '12',
    '3',
    '5',
    '70',
    '35',
    '2',
    '5',
    '17',
    '21',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    '5',
    '2',
    '3(5)*',
    '9(6)*'
  ];
  List strongProtan = [
    '12',
    '3',
    '5',
    '70',
    '35',
    '2',
    '5',
    '17',
    '21',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    '5',
    '2',
    '5',
    '6'
  ];
  List mildProtan = [
    '12',
    '3',
    '5',
    '70',
    '35',
    '2',
    '5',
    '17',
    '21',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    '5',
    '2',
    '(3)5*',
    '(9)6*'
  ];
  List totalColorblindness = [
    '12',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X',
    'X'
  ];
  String result = '';
  bool flag = false;
  Color selected = AppTheme.blue;
  Color unselected = greyBG;
  bool rgcb = false;
  String label = "Red-green color deficiency";
  getData() {
    for (var i in widget.answers!) {
      if (i == 'Plate cannot be read')
        answerList.add('X');
      else
        answerList.add(i);
    }
    if (answerList[19] == 'Left number is more clear')
      answerList[19] = '3(5)*';
    else if (answerList[19] == 'Right number is more clear')
      answerList[19] = '(3)5*';
    else if (answerList[19] == 'Both are clear') answerList[19] = '35';
    if (answerList[20] == 'Left number is more clear')
      answerList[20] = '9(6)*';
    else if (answerList[20] == 'Right number is more clear')
      answerList[20] = '(9)6*';
    else if (answerList[20] == 'Both are clear') answerList[20] = '96';
    if (listEquals(answerList, correctAnswers)) {
      result = "Normal vision";
    } else if (listEquals(answerList, mildDutan)) {
      rgcb = true;
      result = "Mild Dutan Colour Blindness";
    } else if (listEquals(answerList, strongDutan)) {
      rgcb = true;
      result = "Strong Dutan Colour Blindness";
    } else if (listEquals(answerList, mildProtan)) {
      rgcb = true;
      result = "Mild Protan Colour Blindness";
    } else if (listEquals(answerList, strongProtan)) {
      rgcb = true;
      result = "Strong Protan Colour Blindness";
    } else if (listEquals(answerList, totalColorblindness)) {
      result = "Total Colour Blindness";
    } else {
      result = "Not Definite";
    }
    postResult();
  }
  postResult() async {
    FireBaseHelper fireBaseHelper = FireBaseHelper();
    fireBaseHelper.addResult(result, 1);
  }
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Style styles = new Style(height);
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: (answerList.length == 21)
              ? Column(
                  children: <Widget>[
                    // Container(
                    //   padding: EdgeInsets.only(
                    //       top: MediaQuery.of(context).padding.top,
                    //       left: 16,
                    //       right: 16),
                    //   child: Text(""),
                    // ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: AppTheme.blue,
                                // height: height * 0.18,
                                width: width,
                                padding: EdgeInsets.only(
                                    top: height * 0.02,
                                    left: width * 0.01,
                                    right: width * 0.01,
                                    bottom: height * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                            size: height * 0.04,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.25,
                                        ),
                                        Container(
                                          child: Text(
                                            "RESULT",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.032,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    rgcb
                                        ? Center(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: width * 0.08,
                                                right: width * 0.08,
                                              ),
                                              child: Text(
                                                label,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: height * 0.03,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: height * 0.005,
                                          left: width * 0.08,
                                          right: width * 0.08,
                                        ),
                                        child: Text(
                                          result,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: rgcb
                                                ? height * 0.024
                                                : height * 0.035,
                                            fontWeight: rgcb
                                                ? FontWeight.w400
                                                : FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              flag = false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  bottomLeft:
                                                      Radius.circular(8)),
                                              color:
                                                  !flag ? selected : unselected,
                                            ),
                                            height: height * 0.05,
                                            child: Center(
                                              child: Text(
                                                'Next Step',
                                                style: !flag
                                                    ? styles
                                                        .getanswersWhiteTextStyle()
                                                    : styles
                                                        .getanswersGreyTextStyle(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              flag = true;
                                            });
                                          },
                                          child: Container(
                                            height: height * 0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8)),
                                              color:
                                                  flag ? selected : unselected,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Details',
                                                style: flag
                                                    ? styles
                                                        .getanswersWhiteTextStyle()
                                                    : styles
                                                        .getanswersGreyTextStyle(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              !flag
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: greyBG,
                                      ),
                                      width: width,
                                      margin: EdgeInsets.only(
                                          left: width * 0.02,
                                          right: width * 0.02),
                                      padding: EdgeInsets.all(width * 0.035),
                                      child: Column(
                                        //wat u wanna do margin everywheretext ke around
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            'ADVICE',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.025,
                                              color: AppTheme.darkText,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            'Patients with more than two incorrect plates are considered to have color vision deficiency.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.02,
                                              color: AppTheme.dark_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            'MANAGEMENT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.025,
                                              color: AppTheme.darkText,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            'Patients with color vision deficiency should undergo further evaluation by an ophthalmologist or neuro-ophthalmologist.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: height * 0.02,
                                              color: AppTheme.dark_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: height * 0.7,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Plate Number',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: height * 0.022,
                                                    color: AppTheme.dark_grey,
                                                  )),
                                              Text('Your Answer',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: height * 0.022,
                                                    color: AppTheme.dark_grey,
                                                  )),
                                              Text('Correct Answer',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: height * 0.022,
                                                    color: AppTheme.dark_grey,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            height: 1.0,
                                            width: width,
                                            color: Colors.black26,
                                          ),
                                          Container(
                                            height: height * 0.57,
                                            child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              padding: EdgeInsets.all(0.0),
                                              itemCount: widget.answers!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Container(
                                                  color: Colors.white,
                                                  width: width,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: height * 0.05,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Center(
                                                                child: Text(
                                                                    (index + 1)
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppTheme
                                                                          .darkText,
                                                                    )),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Center(
                                                                child: Text(
                                                                    answerList[
                                                                        index],
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppTheme
                                                                          .darkText,
                                                                    )),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Center(
                                                                child: Text(
                                                                    correctAnswers[
                                                                        index],
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppTheme
                                                                          .darkText,
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 1.0,
                                                        width: width,
                                                        color: Colors.black12,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              '*The numbers in parentheses indicate they can be read but are comparatively unclear',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: height * 0.02,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
