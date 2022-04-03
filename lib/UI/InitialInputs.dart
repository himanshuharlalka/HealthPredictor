import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/loading.dart';
import 'package:health_predictor/model/user.dart';
import 'package:health_predictor/services/firebaseHelper.dart';
import 'package:intl/intl.dart';

import 'navigationbase.dart';

class InitialInputs extends StatefulWidget {
  final bool refill;
  const InitialInputs({Key? key, required this.refill}) : super(key: key);

  @override
  _InitialInputsState createState() => _InitialInputsState();
}

class _InitialInputsState extends State<InitialInputs> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  static List<String?> typesList = [''];
  String gender = 'Male';
  Map<String, dynamic> map = {};
  FireBaseHelper fireBaseHelper = new FireBaseHelper();
  User? user = FirebaseAuth.instance.currentUser;
  bool flag = false;
  @override
  void initState() {
    super.initState();
    getData();

    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  late UserDetails uD;
  getData() async {
    uD = await fireBaseHelper.getUserDetails();
    if (!widget.refill && uD.height!.isNotEmpty) {
      Navigator.push(
          (context),
          MaterialPageRoute(
            builder: (context) => NavigationHomeScreen(),
          ));
    }

    setState(() {
      gender = uD.gender!;
      map['height'] = uD.height;
      map['weight'] = uD.weight;
      map['bloodgroup'] = uD.bloodgroup;
      map['dob'] = uD.dob;
      _nameController.text = uD.dob!;
      flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (flag)
        ? Container(
            color: AppTheme.nearlyWhite,
            child: SafeArea(
                top: false,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(children: <Widget>[
                    // SizedBox(
                    //   height: 0.02 * MediaQuery.of(context).size.height,
                    // ),
                    getAppBarUI(),
                    // SizedBox(
                    //   height: 0.02 * MediaQuery.of(context).size.height,
                    // ),
                    Form(
                      key: _formKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.02 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Container(
                                    child: Text(
                                      "Date of Birth:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0,
                                        left: 18,
                                        right: 18,
                                        bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 56,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(13.0),
                                                  bottomLeft:
                                                      Radius.circular(13.0),
                                                  topLeft:
                                                      Radius.circular(13.0),
                                                  topRight:
                                                      Radius.circular(13.0),
                                                ),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16,
                                                                right: 8),
                                                        child: TextField(
                                                          controller:
                                                              _nameController,
                                                          //editing controller of this TextField
                                                          decoration:
                                                              InputDecoration(
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .calendar_today,
                                                              size: 20.0,
                                                              color: AppTheme
                                                                  .darkText,
                                                            ),
                                                            //icon of text field
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          readOnly:
                                                              true, //set it true, so that user will not able to edit text
                                                          onTap: () async {
                                                            DateTime?
                                                                pickedDate =
                                                                await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate: (uD
                                                                            .dob!
                                                                            .isNotEmpty)
                                                                        ? DateTime.parse(uD
                                                                            .dob!)
                                                                        : DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                                    lastDate:
                                                                        DateTime(
                                                                            2101));

                                                            if (pickedDate !=
                                                                null) {
                                                              print(
                                                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                              String
                                                                  formattedDate =
                                                                  DateFormat(
                                                                          'yyyy-MM-dd')
                                                                      .format(
                                                                          pickedDate);
                                                              print(
                                                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                                                              //you can implement different kind of Date Format here according to your requirement

                                                              setState(() {
                                                                _nameController
                                                                        .text =
                                                                    formattedDate;
                                                                map['dob'] =
                                                                    formattedDate; //set output date to TextField value.
                                                              });
                                                            } else {
                                                              print(
                                                                  "Date is not selected");
                                                            }
                                                          },
                                                        )
                                                        // child: TextFormField(
                                                        //   style: TextStyle(
                                                        //     fontFamily: 'WorkSans',
                                                        //     fontWeight: FontWeight.w400,
                                                        //     fontSize: 15,
                                                        //   ),
                                                        //   keyboardType:
                                                        //       TextInputType.datetime,
                                                        //   decoration: InputDecoration(
                                                        //     //labelText: 'Search for course',
                                                        //     border: InputBorder.none,
                                                        //   ),
                                                        //   validator: (v) {
                                                        //     if (v!.trim().isEmpty)
                                                        //       return 'Please enter something';
                                                        //     return null;
                                                        //   },
                                                        //   onChanged: (val) {
                                                        //     setState(() {
                                                        //       // postItem.locfound = val;
                                                        //     });
                                                        //   },
                                                        // ),
                                                        // child: CupertinoDatePicker(
                                                        //   mode: CupertinoDatePickerMode
                                                        //       .date,
                                                        //   initialDateTime:
                                                        //       DateTime.now(),
                                                        //   onDateTimeChanged:
                                                        //       (DateTime newDateTime) {
                                                        //     // Do something
                                                        //   },
                                                        // ),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              height: 0.005 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Gender:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0,
                                        left: 18,
                                        right: 18,
                                        bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 56,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(13.0),
                                                  bottomLeft:
                                                      Radius.circular(13.0),
                                                  topLeft:
                                                      Radius.circular(13.0),
                                                  topRight:
                                                      Radius.circular(13.0),
                                                ),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      margin: EdgeInsets.only(
                                                          left: 16.0,
                                                          right: 16.0),
                                                      child:
                                                          DropdownButtonFormField<
                                                              String>(
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        focusColor:
                                                            Colors.white,
                                                        value: gender,
                                                        //elevation: 5,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        iconEnabledColor:
                                                            Colors.black,
                                                        items: <String>[
                                                          'Male',
                                                          'Female',
                                                          'Other'
                                                        ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                          (String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                  color: AppTheme
                                                                      .darkText,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).toList(),
                                                        validator: (v) {
                                                          if (v!.trim() == "")
                                                            return 'Please enter something';
                                                          return null;
                                                        },
                                                        onChanged:
                                                            (String? value) {
                                                          setState(
                                                            () {
                                                              gender = value!;
                                                              map['gender'] =
                                                                  gender;
                                                            },
                                                          );
                                                        },
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
                                  Container(
                                    child: Text(
                                      "Height (in cm):",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0,
                                        left: 18,
                                        right: 18,
                                        bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 56,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(13.0),
                                                  bottomLeft:
                                                      Radius.circular(13.0),
                                                  topLeft:
                                                      Radius.circular(13.0),
                                                  topRight:
                                                      Radius.circular(13.0),
                                                ),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16,
                                                              right: 16),
                                                      child: TextFormField(
                                                        initialValue: uD.height,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'WorkSans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                          //labelText: 'Search for course',
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        validator: (v) {
                                                          if (v!.trim().isEmpty)
                                                            return 'Please enter something';
                                                          return null;
                                                        },
                                                        onChanged: (val) {
                                                          setState(() {
                                                            map['height'] = val;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              height: 0.005 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Weight (in kg):",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 18),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0,
                                          left: 18,
                                          right: 18,
                                          bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: 56,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6, bottom: 6),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(13.0),
                                                    bottomLeft:
                                                        Radius.circular(13.0),
                                                    topLeft:
                                                        Radius.circular(13.0),
                                                    topRight:
                                                        Radius.circular(13.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16,
                                                                right: 16),
                                                        child: TextFormField(
                                                          initialValue:
                                                              uD.weight,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'WorkSans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15,
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                            //labelText: 'Search for course',
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          // validator: (v) {
                                                          //   if (v.trim().isEmpty)
                                                          //     return 'Please enter something';
                                                          //   return null;
                                                          // },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              map['weight'] =
                                                                  val;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                                height: 0.005 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height),
                                          ),
                                        ],
                                      )),
                                  Container(
                                    child: Text(
                                      "Blood Group:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0,
                                        left: 18,
                                        right: 18,
                                        bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 56,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, bottom: 6),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(13.0),
                                                  bottomLeft:
                                                      Radius.circular(13.0),
                                                  topLeft:
                                                      Radius.circular(13.0),
                                                  topRight:
                                                      Radius.circular(13.0),
                                                ),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16,
                                                              right: 16),
                                                      child: TextFormField(
                                                        initialValue:
                                                            uD.bloodgroup,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'WorkSans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                        ),
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          //labelText: 'Search for course',
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                        // validator: (v) {
                                                        //   if (v.trim().isEmpty)
                                                        //     return 'Please enter something';
                                                        //   return null;
                                                        // },
                                                        onChanged: (val) {
                                                          setState(() {
                                                            map['bloodgroup'] =
                                                                val;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                              height: 0.005 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 18),
                                    child: Text(
                                      'Current Medical Ailments',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.2,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                  ),
                                  ..._getFriends(),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Center(
                                      child: FlatButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            map['ailments'] = typesList;
                                            map['gender'] = gender;
                                            fireBaseHelper.addDetails(map);
                                            // postItem.types=typesList;
                                            // postItem.datetime=DateTime.now();
                                            // postItem.claimedby="";
                                            // postItem.claimers=[];
                                            // postItem.admin="DWctr1yJVoaV46SKQxQ5";
                                            _formKey.currentState!.reset();
                                            Navigator.push(
                                                (context),
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavigationHomeScreen(),
                                                ));
                                            //await FirebaseApi.uploadItem(postItem);
                                          }
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppTheme.white,
                                              fontSize: 0.025 *
                                                  (MediaQuery.of(context)
                                                      .size
                                                      .height)),
                                        ),
                                        color: AppTheme.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        minWidth: 0.4 *
                                            (MediaQuery.of(context).size.width),
                                        height: 0.06 *
                                            (MediaQuery.of(context)
                                                .size
                                                .height),
                                      ),
                                    ),
                                  ),
                                  // Flexible(
                                  //   child: getPopularCourseUI(),
                                  // ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )))
        : Loading();
  }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < typesList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          children: [
            FriendTextFields(i),

            // we need add button at last friends row
            _addRemoveButton(i == 0, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          typesList.insert(0, '');
        } else
          typesList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? AppTheme.blue : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      color: AppTheme.blue,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi ' + ((user!.displayName) ?? "") + ',',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 0.27,
                    color: AppTheme.white,
                  ),
                ),
                SizedBox(
                  height: 0.01 * MediaQuery.of(context).size.height,
                ),
                Text(
                  'Please enter your details.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: 60,
          //   height: 60,
          //   child: Image.asset('assets/design_course/userImage.png'),
          // )
        ],
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;

  FriendTextFields(this.index);

  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _nameController.text = _InitialInputsState.typesList[widget.index] ?? '';
    });

    return Padding(
        padding: const EdgeInsets.only(
          top: 2.0,
          left: 18,
          right: 8,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                controller: _nameController,
                                onChanged: (v) {
                                  _InitialInputsState.typesList[widget.index] =
                                      v;
                                },
                                decoration: InputDecoration(
                                  hintText: '',
                                  border: InputBorder.none,
                                ),
                                validator: (v) {
                                  if (v!.trim().isEmpty)
                                    return 'Please enter something';
                                  return null;
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }
}
