import 'package:flutter/material.dart';
import 'package:health_predictor/common/CommonWidgets.dart';

import '../app_theme.dart';

class HealthJournal extends StatefulWidget {
  const HealthJournal({Key? key}) : super(key: key);

  @override
  _HealthJournalState createState() => _HealthJournalState();
}

class _HealthJournalState extends State<HealthJournal> {
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
                  appBar('Health Journal'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.07, right: width * 0.07),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                "eshiett1995",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "4:33am",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.blue),
                              ),
                            ],
                          ),
                          Divider(color: AppTheme.lightText),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                //
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: height * 0.032,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            color: AppTheme.white,
                                            fontSize: height * 0.027,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]))));
  }
}
