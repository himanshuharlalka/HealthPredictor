import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_theme.dart';
import '../firebase_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int a=0,b=0,c=0;

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
            top: false,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(children: <Widget>[
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
                              child: Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Center(
                                  child: Image.asset(
                                "lib/images/search.png",
                                width: 100,
                                height: 100,
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
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
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Card(
                                                    margin: EdgeInsets.only(bottom: 10),
                                                      elevation:10,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                      ),

                                                      child: new Column(

                                                          children: [
                                                            Container(

                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(8.0),
                                                                      topRight: Radius.circular(8.0),
                                                                      bottomLeft: Radius.circular(8.0),
                                                                      bottomRight: Radius.circular(8.0)

                                  ),

                                                                image: DecorationImage(
                                                                  image: AssetImage('lib/images/unnamed2.png'),

                                                                  fit: BoxFit.fitWidth
                                                                )

                                                              ),
                                                                width: width*0.42,
                                                                height: height*0.28,
                                                                child:Container(
                                                                  alignment: Alignment.bottomCenter,
                                                                  margin: EdgeInsets.only(left: 5, right: 5),

                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Container(
                                                                        margin:EdgeInsets.only(bottom:15),
                                                                        child:
                                                                        Text("Heart Attack",style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: height*0.03,
                                                                          fontWeight: FontWeight.w500,
                                                                          letterSpacing: 1,
                                                                        ),
                                                                          textAlign: TextAlign.center,),

                                                                      ),

                                                                    ],
                                                                  ),
                                                                )

                                                            ),
                                                          ])),
                                                  Card(
                                                      margin: EdgeInsets.only(top: 20, bottom: 10),
                                                      elevation:10,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                      ),

                                                      child: new Column(
                                                          children: [
                                                            Container(
                                                                width: width*0.42,
                                                                height: height*0.28,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(8.0),
                                                                        topRight: Radius.circular(8.0),
                                                                        bottomLeft: Radius.circular(8.0),
                                                                        bottomRight: Radius.circular(8.0)

                                                                    ),

                                                                    image: DecorationImage(
                                                                        image: AssetImage('lib/images/unnamed2.png'),

                                                                        fit: BoxFit.fitWidth
                                                                    )

                                                                ),

                                                                child:Container(
                                                                  alignment: Alignment.bottomCenter,
                                                                  margin: EdgeInsets.only(left: 5, right: 5),

                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Container(
                                                                        margin:EdgeInsets.only(bottom:15),
                                                                        child:
                                                                        Text("PCOD",style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: height*0.03,
                                                                          fontWeight: FontWeight.w500,
                                                                          letterSpacing: 1,
                                                                        ),
                                                                          textAlign: TextAlign.center,),

                                                                      ),

                                                                    ],
                                                                  ),
                                                                )

                                                            ),
                                                          ])),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Card(
                                                      margin: EdgeInsets.only(bottom: 10),
                                                      elevation:10,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                      ),

                                                      child: new Column(

                                                          children: [
                                                            Container(

                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(8.0),
                                                                        topRight: Radius.circular(8.0),
                                                                        bottomLeft: Radius.circular(8.0),
                                                                        bottomRight: Radius.circular(8.0)

                                                                    ),

                                                                    image: DecorationImage(
                                                                        image: AssetImage('lib/images/unnamed2.png'),

                                                                        fit: BoxFit.fitWidth
                                                                    )

                                                                ),
                                                                width: width*0.42,
                                                                height: height*0.28,
                                                                child:Container(
                                                                  alignment: Alignment.bottomCenter,
                                                                  margin: EdgeInsets.only(left: 5, right: 5),

                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Container(
                                                                        margin:EdgeInsets.only(bottom:15),
                                                                        child:
                                                                        Text("Myopia",style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: height*0.03,
                                                                          fontWeight: FontWeight.w500,
                                                                          letterSpacing: 1,
                                                                        ),
                                                                          textAlign: TextAlign.center,),

                                                                      ),

                                                                    ],
                                                                  ),
                                                                )

                                                            ),
                                                          ])),
                                                  Card(
                                                      margin: EdgeInsets.only(top:20, bottom: 10),
                                                      elevation:10,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                      ),

                                                      child: new Column(

                                                          children: [
                                                            Container(
                                                                width: width*0.42,
                                                                height: height*0.28,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(8.0),
                                                                        topRight: Radius.circular(8.0),
                                                                        bottomLeft: Radius.circular(8.0),
                                                                        bottomRight: Radius.circular(8.0)

                                                                    ),

                                                                    image: DecorationImage(
                                                                        image: AssetImage('lib/images/unnamed1.png'),

                                                                        fit: BoxFit.fitWidth
                                                                    )

                                                                ),

                                                                child:Container(
                                                                  alignment: Alignment.bottomCenter,
                                                                  margin: EdgeInsets.only(left: 5, right: 5),

                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      Container(
                                                                        margin:EdgeInsets.only(bottom:15),
                                                                        child:
                                                                          Text("Color Blindness",style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: height*0.03,
                                                                              fontWeight: FontWeight.w500,
                                                                              letterSpacing: 1,
                                                                              ),
                                                                            textAlign: TextAlign.center,),

                                                                      ),

                                                                    ],
                                                                  ),
                                                                )


                                                            ),
                                                          ])),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),


                          ]))))
                ]))));
  }
}
