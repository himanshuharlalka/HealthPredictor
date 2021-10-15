import 'package:flutter/material.dart';
import 'package:health_predictor/UI/ColorBlindnessResult.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/common/GradientProgressBar.dart';
import 'package:health_predictor/common/MCQ.dart';
import 'package:health_predictor/common/navigate_buttons.dart';
import 'package:hexcolor/hexcolor.dart';

class StartTestCard extends StatefulWidget {
  final String? image;
  final String? text;
  final String? instructions;
  final String? title;
  final Function? onPress;
  const StartTestCard(
      {Key? key,
      required this.image,
      required this.text,
      required this.title,
      required this.onPress,
      required this.instructions})
      : super(key: key);

  @override
  _StartTestCardState createState() => _StartTestCardState();
}

class _StartTestCardState extends State<StartTestCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
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
                              top: height * 0.01,
                              left: width * 0.01,
                              right: width * 0.01,
                              bottom: height * 0.01),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: height * 0.04,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Text(
                                    widget.title!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.032,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: height * 0.01,
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                          child: Center(
                              child: Image.asset(
                            widget.image!,
                            width: width * 0.75,
                            height: height * 0.25,
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.01,
                              bottom: height * 0.01,
                              left: width * 0.05,
                              right: width * 0.05),
                          child: Text(
                            widget.text!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.01,
                              bottom: height * 0.01,
                              left: width * 0.05,
                              right: width * 0.05),
                          child: Text(
                            'Instructions:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.032,
                              fontWeight: FontWeight.w600,
                              // decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              bottom: height * 0.035),
                          child: Text(
                            widget.instructions!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.027,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              widget.onPress!();
                            },
                            child: Ink(
                              height: 0.065 * height,
                              width: 0.35 * width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: AppTheme.blue,
                              ),
                              child: Center(
                                child: Text(
                                  'Start Test',
                                  style: TextStyle(
                                      color: AppTheme.white,
                                      fontSize: height * 0.027,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
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
