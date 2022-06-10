import 'package:flutter/material.dart';
import 'package:health_predictor/common/Colors_App.dart';
import 'package:health_predictor/common/Text_Styles.dart';
import 'package:health_predictor/services/firebaseHelper.dart';

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
    '-2.50',
    '-1.75 to -2.0',
    '-1.50',
    '-1.0',
    '-0.5',
    'plano to -0.125',
    'plano',
    'plano'
  ];

  @override
  void initState() {
    result =
        acuityUS[widget.answers] + " (" + acuityNonUS[widget.answers] + ")";
    postResult();
    super.initState();
  }

  postResult() async {
    FireBaseHelper fireBaseHelper = FireBaseHelper();
    fireBaseHelper.addResult(result, 0);
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
                                    width: width * 0.16,
                                  ),
                                  Container(
                                    child: Text(
                                      "VISUAL ACUITY",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                (widget.answers < 5)
                                    ? '''You seem to have difficulties recognising small characters.'''
                                    : '''Congratulations, your visual acuity seems good.''',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.030,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Text(
                                'ADVICE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.027,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                (widget.answers < 5)
                                    ? '''We recommend you have a vision exam with an eye care professional.'''
                                    : '''However, to verify the health of your eyes, don't hesitate to fix an appointment with an eye care professional.''',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.023,
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
                                  fontSize: height * 0.027,
                                  color: AppTheme.darkText,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                'Visual acuity worse than 20/25 (0.8 if non-US) should be evaluated by a licensed eye professional to determine whether corrective lenses or other treatments may be necessary',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.023,
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
