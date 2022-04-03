import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/UI/InitialInputs.dart';
import 'package:health_predictor/common/CommonWidgets.dart';
import 'package:health_predictor/loading.dart';
import 'package:health_predictor/model/user.dart';
import 'package:health_predictor/services/firebaseHelper.dart';

import '../app_theme.dart';

class HealthJournal extends StatefulWidget {
  const HealthJournal({Key? key}) : super(key: key);

  @override
  _HealthJournalState createState() => _HealthJournalState();
}

class DataRequiredForBuild {
  UserDetails userDetails;

  DataRequiredForBuild({required this.userDetails});
}

class _HealthJournalState extends State<HealthJournal> {
  Future<DataRequiredForBuild> _fetchAllData() async {
    FireBaseHelper firebaseFetch = new FireBaseHelper();
    return DataRequiredForBuild(
        userDetails: await firebaseFetch.getUserDetails());
  }

  late Future<DataRequiredForBuild> _dataRequiredForBuild;
  @override
  void initState() {
    super.initState();
    _dataRequiredForBuild = _fetchAllData();
  }

  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
            top: false,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(children: <Widget>[
                  appBar('Health Journal'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: FutureBuilder<DataRequiredForBuild>(
                          future: _dataRequiredForBuild,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: width * 0.07, right: width * 0.07),
                                child: Column(children: [
                                  details(
                                      "Name", snapshot.data!.userDetails.name!),
                                  Divider(color: AppTheme.lightText),
                                  details("Date of Birth",
                                      snapshot.data!.userDetails.dob!),
                                  Divider(color: AppTheme.lightText),
                                  details("Gender",
                                      snapshot.data!.userDetails.gender!),
                                  Divider(color: AppTheme.lightText),
                                  details(
                                      "Height",
                                      snapshot.data!.userDetails.height! +
                                          "cm"),
                                  Divider(color: AppTheme.lightText),
                                  details(
                                      "Weight",
                                      snapshot.data!.userDetails.weight! +
                                          "kg"),
                                  Divider(color: AppTheme.lightText),
                                  details("Blood Group",
                                      snapshot.data!.userDetails.bloodgroup!),
                                  Divider(color: AppTheme.lightText),
                                  SizedBox(height: height * 0.03),
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            (context),
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  InitialInputs(refill: true),
                                            ));
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
                                                size: height * 0.03,
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Text(
                                                'Edit Profile',
                                                style: TextStyle(
                                                    color: AppTheme.white,
                                                    fontSize: height * 0.025,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            } else {
                              return Loading();
                            }
                          }),
                    ),
                  ),
                ]))));
  }

  Widget details(String tag, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          tag,
          style:
              TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.w700,
              color: AppTheme.blue),
        ),
      ],
    );
  }
}
