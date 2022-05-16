import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/common/Colors_App.dart';
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
  List questions = ['Are the predictions 100% accurate?', 'How are the predictions made?', 'How do we contact the doctors?', 'How do you perform each test?', 'Are the tests reliable?'];
  List answers = [
    'No, they are not 100% accurate. They are accurate enough to indicate if you are at a higher risk.',
    'We have trained and tested the data using various machine learning techniques and the one with the best accuracy has been chosen.',
    'The doctor recommendation module will list all the doctors based on your location. To book an appointment you can contact them at your convenience.',
    'Once you start the test, instructions for the same will be provided before beginning it. Follow them to get accurate results.',
    'Please answer the questions honestly to get accurate enough results.'
  ];
  List<bool> isOpened = [false, false, false, false, false];
  List images = [
    'lib/images/gallery-1.jpg',
    'lib/images/gallery-2.jpg',
    'lib/images/gallery-3.jpg',
    'lib/images/gallery-4.jpg',
    'lib/images/gallery-5.jpg',
    'lib/images/gallery-6.jpg',
    'lib/images/gallery-7.jpg',
    'lib/images/gallery-8.jpg',
  ];
  IconData icon = Icons.arrow_drop_down;
  int _current = 0;
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
                                "An initiative to predict ailments from the comfort of your own home.",
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
                            Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CarouselSlider(
                                      items: images
                                          .map(
                                            (item) => InkWell(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.79,
                                                child: Image.asset(
                                                  item,
                                                  width: width,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.76,
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(
                                            () {
                                              _current = index;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.4,
                                  ),
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: getCarouselIndicator(
                                          _current, images)),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Container(
                              padding: EdgeInsets.all(width * 0.06),
                              color: AppTheme.lightBlue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.copyright,
                                        size: height * 0.02,
                                      ),
                                      Text(
                                        ' Copyright 2021, All Rights Reserved',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: height * 0.02,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.007,
                                  ),
                                  Container(
                                    child: Text(
                                      'Designed by Chirag, Devanshi, Hetvi, Himanshu & Ishika.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: height * 0.02,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
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
