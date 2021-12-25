import 'package:flutter/material.dart';
import 'package:health_predictor/UI/ColorBlindness.dart';
import 'package:health_predictor/UI/Myopia.dart';
import 'package:health_predictor/UI/StartTestCard.dart';
import 'package:health_predictor/common/CommonWidgets.dart';
import 'package:health_predictor/loading.dart';
import 'package:health_predictor/services/firebaseHelper.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_theme.dart';
import '../firebase_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int a = 0, b = 0, c = 0;
  FireBaseHelper fb = new FireBaseHelper();
  int? userHeight;
  bool flag = false;
  setHeight() async {
    userHeight = await fb.getHeight();
    setState(() {
      flag = true;
    });
    
  }

  @override
  void initState() {
    super.initState();
    setHeight();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return (flag)
        ? Container(
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
                                margin: EdgeInsets.only(top: height * 0.03),
                                child: Center(
                                    child: Image.asset(
                                  "lib/images/HoPElogo.png",
                                  width: 100,
                                  height: 100,
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: height * 0.025, bottom: height * 0.01),
                                child: Text(
                                  'WELCOME TO HoPE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        homeCards(
                                            context,
                                            'lib/images/heartbeat.png',
                                            'Heart Attack',
                                            () {},
                                            false),
                                        homeCards(
                                            context,
                                            'lib/images/pills.png',
                                            'PCOD',
                                            () {},
                                            true)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        homeCards(context, 'lib/images/eye.png',
                                            'Myopia', () {
                                          Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StartTestCard(
                                                title: 'Myopia',
                                                image:
                                                    'lib/images/myopia_st.png',
                                                text:
                                                    '''Myopia is a vision condition in which you can see objects near to you clearly, but objects farther away are blurry.''',
                                                instructions:
                                                    '''• Keep your arm straight with the phone in your hand.
• Clearly call out the direction in which the E is facing. (i.e. Left, Right, Up or Down)
• Use a microphone for better results.
• Ensure proper room lighting and phone brightness.''',
                                                onPress: () {
                                                  Navigator.pushReplacement(
                                                    (context),
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Myopia(
                                                        height: userHeight!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }, false),
                                        homeCards(context, 'lib/images/dna.png',
                                            'Color Blindness', () {
                                          Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StartTestCard(
                                                title: 'Color Blindness',
                                                image:
                                                    'lib/images/colorblindness_st.png',
                                                text:
                                                    '''Color blindness often happens when someone cannot distinguish between certain colors. It is also known as color deficiency.''',
                                                instructions:
                                                    '''• Ensure proper room lighting and phone brightness.
• Wear any glasses if necessary for near vision.
• Hold screen at a comfortable reading distance (~14 inches or 35 cm).''',
                                                onPress: () {
                                                  Navigator.pushReplacement(
                                                    (context),
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ColorBlindness(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }, true),
                                      ],
                                    ),
                                  ],
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
          )
        : Loading();
  }
}
