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
  List questions = ['Are the predictions 100% accurate?', '', '', '', ''];
  List answers = [
    'No, they are not 100% accurate. They are accurate enough to indicate if you are at a higher risk.',
    '',
    '',
    '',
    ''
  ];
  List<bool> isOpened = [false, false, false, false, false];
  IconData icon = Icons.arrow_drop_down;
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
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        child: Column(
                          children: [
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
                            ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: height * 0.025),
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.only(
                                        bottom: height * 0.02,
                                        left: height * 0.025,
                                        right: height * 0.025),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(height * 0.012),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isOpened[index] = !isOpened[index];
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(height * 0.015),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ImageIcon(
                                                                AssetImage(
                                                                    'lib/images/question_mark.png'),
                                                                size: height *
                                                                    0.02,
                                                                color: AppTheme
                                                                    .blue,
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  questions[
                                                                      index],
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        height *
                                                                            0.023,
                                                                    letterSpacing:
                                                                        0.27,
                                                                    color: (!isOpened[
                                                                            index])
                                                                        ? AppTheme
                                                                            .darkerText
                                                                        : AppTheme
                                                                            .blue,
                                                                  ),
                                                                ),
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    WidgetSpan(
                                                                      child:
                                                                          Icon(
                                                                        (!isOpened[index])
                                                                            ? Icons.arrow_drop_down
                                                                            : Icons.arrow_drop_up,
                                                                        color: AppTheme
                                                                            .nearlyBlack,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          (isOpened[index])
                                                              ? Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              7,
                                                                          bottom:
                                                                              6),
                                                                  child: Text(
                                                                    answers[
                                                                        index],
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          height *
                                                                              0.02,
                                                                      letterSpacing:
                                                                          0.2,
                                                                      color: AppTheme
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(),
                                                          // Text(
                                                          //   widget.messageText,
                                                          //   style: TextStyle(
                                                          //       fontSize: 13,
                                                          //       color: Colors.grey.shade600,
                                                          //       fontWeight: FontWeight.normal),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Text(
                                            //   widget.time,
                                            //   style: TextStyle(
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.normal),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                // itemBuilder: (context, index) {
                                //   return ConversationList(
                                //     name: chatUsers[index].name,
                                //     messageText: chatUsers[index].messageText,
                                //     imageUrl: chatUsers[index].image,
                                //     time: chatUsers[index].time,
                                //     isMessageRead:
                                //         (index == 0 || index == 3) ? true : false,
                                //   );
                                // },
                                ),
                            SizedBox(height: height * 0.02),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top,
                                  left: height * 0.035,
                                  right: height * 0.035),
                              child: Text(
                                "Gallery",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.03,
                                  letterSpacing: 1,
                                  color: AppTheme.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}
