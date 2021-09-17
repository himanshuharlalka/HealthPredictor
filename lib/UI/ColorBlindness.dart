import 'package:flutter/material.dart';
import 'package:health_predictor/UI/ColorBlindnessResult.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:health_predictor/common/GradientProgressBar.dart';
import 'package:health_predictor/common/MCQ.dart';
import 'package:health_predictor/common/navigate_buttons.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorBlindness extends StatefulWidget {
  const ColorBlindness({Key? key}) : super(key: key);

  @override
  _ColorBlindnessState createState() => _ColorBlindnessState();
}

class _ColorBlindnessState extends State<ColorBlindness> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 500);
  static const _kCurve = Curves.ease;
  int pos = 0;
  List<bool>? _isFilled;
  List<dynamic>? answers;
  String? selectedMcq;
  bool? showPopup;
  String ques = 'What number do you see?';
  @override
  void initState() {
    _isFilled = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    answers = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    selectedMcq = '';
    showPopup = true;

    super.initState();
  }

  void changePos(value) {
    setState(() {
      pos = value;
    });
  }

  void changeIsFilled(bool value) {
    setState(() {
      _isFilled![pos] = value;
    });
  }

  void nextPage() {
    if (pos != 10) {
      changePos(pos + 1);
      _controller.nextPage(duration: _kDuration, curve: _kCurve);
    } else {
      //test finish code
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ColorBlindnessResult(answers: answers)));
    }
  }

  void prevPage() {
    if (pos != 0) {
      changePos(pos - 1);
      _controller.previousPage(
        duration: _kDuration,
        curve: _kCurve,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void saveSliderAnswers1(String level) {
    // setState(() {
    answers![0] = level;
    // });
  }

  void saveSliderAnswers2(String level) {
    // setState(() {
    answers![1] = level;
    // });
  }

  void saveSliderAnswers3(String level) {
    // setState(() {
    answers![2] = level;
    // });
  }

  void saveSliderAnswers4(String level) {
    // setState(() {
    answers![3] = level;
    // });
  }

  void saveSliderAnswers5(String level) {
    // setState(() {
    answers![4] = level;
    // });
  }

  void saveSliderAnswers6(String level) {
    // setState(() {
    answers![5] = level;
    // });
  }

  void saveSliderAnswers7(String level) {
    // setState(() {
    answers![6] = level;
    // });
  }

  void saveSliderAnswers8(String level) {
    // setState(() {
    answers![7] = level;
    // });
  }

  void saveSliderAnswers9(String level) {
    // setState(() {
    answers![8] = level;
    // });
  }

  void saveSliderAnswers10(String level) {
    // setState(() {
    answers![9] = level;
    // });
  }

  void saveSliderAnswers11(String level) {
    // setState(() {
    answers![10] = level;
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: height,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: AppTheme.blue,
                    height: height * 0.12,
                    padding: EdgeInsets.only(top: height * 0.03),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Plate " + (pos + 1).toString() + "/11",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.01,
                          ),
                          child: GradientProgressBar(
                            size: 12,
                            totalSteps: 11,
                            curStep: pos + 1,
                            leftColor: HexColor('#87C3FF'),
                            rightColor: HexColor('#F878AC'),
                            unselectedColor: HexColor('#E5E5E5'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: height * 0.77,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 11,
                      physics: new NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return [
                          MCQ(
                              ['12', 'Other number', 'Plate cannot be read'],
                              ques,
                              'lib/images/ishihara12.png',
                              answers![0],
                              changeIsFilled,
                              saveSliderAnswers1),
                          MCQ([
                            '8',
                            '3',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara8.png', answers![1],
                              changeIsFilled, saveSliderAnswers2),
                          MCQ([
                            '5',
                            '2',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara5.png', answers![2],
                              changeIsFilled, saveSliderAnswers3),
                          MCQ([
                            '29',
                            '70',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara29.png', answers![3],
                              changeIsFilled, saveSliderAnswers4),
                          MCQ([
                            '74',
                            '21',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara74.png', answers![4],
                              changeIsFilled, saveSliderAnswers5),
                          MCQ(
                              ['7', 'Other number', 'Plate cannot be read'],
                              ques,
                              'lib/images/ishihara7.png',
                              answers![5],
                              changeIsFilled,
                              saveSliderAnswers6),
                          MCQ(
                              ['45', 'Other number', 'Plate cannot be read'],
                              ques,
                              'lib/images/ishihara45.png',
                              answers![6],
                              changeIsFilled,
                              saveSliderAnswers7),
                          MCQ(
                              ['2', 'Other number', 'Plate cannot be read'],
                              ques,
                              'lib/images/ishihara2.png',
                              answers![7],
                              changeIsFilled,
                              saveSliderAnswers8),
                          MCQ(
                              ['16', 'Other number', 'Plate cannot be read'],
                              ques,
                              'lib/images/ishihara16.png',
                              answers![8],
                              changeIsFilled,
                              saveSliderAnswers9),
                          MCQ([
                            '3',
                            '5',
                            '35',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara35.png', answers![9],
                              changeIsFilled, saveSliderAnswers10),
                          MCQ([
                            '6',
                            '9',
                            '96',
                            'Other number',
                            'Plate cannot be read'
                          ], ques, 'lib/images/ishihara96.png', answers![10],
                              changeIsFilled, saveSliderAnswers11),
                        ][index % 11];
                      },
                    ),
                  ),
                  //SizedBox(height: height*0.01,),
                  NavigateButtons(
                    pos != 10 ? 'NEXT' : 'FINISH',
                    'BACK',
                    _isFilled![pos],
                    height,
                    width,
                    context,
                    nextPage,
                    prevPage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
