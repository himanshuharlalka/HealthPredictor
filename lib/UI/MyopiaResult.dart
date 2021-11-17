import 'package:flutter/material.dart';
import 'package:health_predictor/common/Colors_App.dart';
import 'package:health_predictor/common/Text_Styles.dart';

import '../app_theme.dart';

class MyopiaResult extends StatefulWidget {
  final int answers;

  const MyopiaResult({Key? key, required this.answers}) : super(key: key);

  @override
  _MyopiaResultState createState() => _MyopiaResultState();
}

class _MyopiaResultState extends State<MyopiaResult> {
  String result = '';
  bool flag = false;
  Color selected = AppTheme.blue;
  Color unselected = greyBG;
  List<String> acuityUS = [
    '20/200',
    '20/100',
    '20/70',
    '20/50',
    '20/30',
    '20/20',
    '20/15',
    '20/10'
  ];
  List<String> acuityNonUS = [
    '0.1',
    '0.2',
    '0.285',
    '0.4',
    '0.667',
    '1.0',
    '1.33',
    '2.0'
  ];

  @override
  void initState() {
    result=acuityUS[widget.answers]+" "+acuityNonUS[widget.answers];
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
          body: Column(
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
                                      fontSize: height * 0.035,
                                      fontWeight: FontWeight.w600,
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)),
                                      color: !flag ? selected : unselected,
                                    ),
                                    height: height * 0.05,
                                    child: Center(
                                      child: Text(
                                        'Next Step',
                                        style: styles.getanswersWhiteTextStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: greyBG,
                          ),
                          width: width,
                          margin: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          padding: EdgeInsets.all(width * 0.035),
                          child: Column(
                            //wat u wanna do margin everywheretext ke around
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
