import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_predictor/common/CommonWidgets.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_theme.dart';
import '../firebase_api.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int a = 0, b = 0, c = 0;

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
                body: Column(children: <Widget>[
                  appBar('About Us'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: height * 0.035,
                        right: height * 0.035),
                    child: Text(
                      "HoPE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.035,
                        letterSpacing: 1,
                        color: AppTheme.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: height * 0.035,
                        right: height * 0.035),
                    child: Text(
                      "An initiative to predict diseases from the comfort of your own home.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.025,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: height * 0.035,
                        right: height * 0.035),
                    child: Text(
                      "FAQs",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.03,
                        letterSpacing: 1,
                        color: AppTheme.blue,
                      ),
                    ),
                  ),
                ]))));
  }
}
