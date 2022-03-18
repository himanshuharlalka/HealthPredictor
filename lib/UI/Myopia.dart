import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/common/GradientProgressBar.dart';
import 'package:health_predictor/common/MyopiaWidgets.dart';
import 'package:health_predictor/common/navigate_buttons.dart';
import 'package:health_predictor/services/firebaseHelper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../app_theme.dart';
import 'MyopiaResult.dart';

class Myopia extends StatefulWidget {
  final int height;
  Myopia({Key? key, required this.height}) : super(key: key);

  @override
  _MyopiaState createState() => _MyopiaState();
}

class _MyopiaState extends State<Myopia> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  //AudioPlayer audioPlayer;
  AudioCache cache = new AudioCache();
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 500);
  static const _kCurve = Curves.ease;
  FireBaseHelper fireBaseHelper = new FireBaseHelper();
  User? user = FirebaseAuth.instance.currentUser;
  int pos = 0;
  List<bool>? _isFilled;
  List<List<String>> answers = [
    ['right', 'write'],
    ['down'],
    ['up', 'aap', 'ab'],
    ['right', 'write'],
    ['left'],
    ['down'],
    ['left'],
    ['up', 'aap', 'ab']
  ];
  String? selectedMcq;
  bool? showPopup;
  String ques = 'What number do you see?';
  List<String> choices = ['up', 'down', 'left', 'right', 'aap', 'ab', 'write'];
  bool canFinish = true;
  bool ended = false;
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
    if (pos != 7) {
      changePos(pos + 1);
      _controller.nextPage(duration: _kDuration, curve: _kCurve);
      playLocal();
      _text = "";
    } else {
      //test finish code
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyopiaResult(answers: pos)));
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

  @override
  void initState() {
    super.initState();
    _initSpeech();
    playLocal();
    _isFilled = [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ];

    selectedMcq = '';
    showPopup = true;
  }

  playLocal() async {
    AudioPlayer audioPlayer = await cache.play("myopia_audio.mp3");
    setState(() => canFinish = false);

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.PAUSED ||
          s == PlayerState.STOPPED ||
          s == PlayerState.COMPLETED) {
        Future.delayed(const Duration(milliseconds: 0), () {
          _listen();
          setState(() => canFinish = true);
        });

        Future.delayed(const Duration(milliseconds: 4000), () {
          if (!ended) {
            setState(() => _isListening = false);
            _speech.stop();
            checkAnswer();
          }
        });
      }
    });
  }

  checkAnswer() {
    print('hi');
    bool flag = false;
    for (var s in choices) {
      print(_text);
      if (_text.toLowerCase().contains(s)) {
        flag = true;
        // print(_text + " SSSSSSSS");
        if (answers[pos].contains(s)) {
          print('called');
          nextPage();
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyopiaResult(answers: pos)));
        }
      }
    }
    if (!flag) {
      print('play again');
      playLocal();
    }
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    super.initState();
    _speech = stt.SpeechToText();
  }

  /// Each time to start a speech recognition session
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
          finalTimeout: Duration(seconds: 20),
          onStatus: (val) {
            print('onStatus: $val');
            if (val == 'done') {
              print(_text);
            }
          },
          onError: (val) {
            print('onError: $val');
            _isListening = false;
          });
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: Duration(seconds: 4),
          pauseFor: Duration(seconds: 4),
          onResult: (val) => setState(() {
            _text = val.recognizedWords;

            print(_text);
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void saveAnswers1(String level) {
    // setState(() {
    // });
  }

  void saveAnswers2(String level) {
    // setState(() {
    // });
  }

  void saveAnswers3(String level) {
    // setState(() {
    // });
  }

  void saveAnswers4(String level) {
    // setState(() {
    // });
  }

  void saveAnswers5(String level) {
    // setState(() {
    // });
  }

  void saveAnswers6(String level) {
    // setState(() {
    // });
  }

  void saveAnswers7(String level) {
    // setState(() {
    // });
  }

  void saveAnswers8(String level) {
    // setState(() {
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
                            "Image " + (pos + 1).toString() + "/8",
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
                            totalSteps: 8,
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
                      itemCount: 8,
                      physics: new NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return [
                          MyopiaWidgets(widget.height, 'lib/images/myopia1.png',
                              'up', changeIsFilled, saveAnswers1),
                          MyopiaWidgets(widget.height, 'lib/images/myopia2.png',
                              'up', changeIsFilled, saveAnswers2),
                          MyopiaWidgets(widget.height, 'lib/images/myopia3.png',
                              'up', changeIsFilled, saveAnswers3),
                          MyopiaWidgets(widget.height, 'lib/images/myopia4.png',
                              'up', changeIsFilled, saveAnswers4),
                          MyopiaWidgets(widget.height, 'lib/images/myopia5.png',
                              'up', changeIsFilled, saveAnswers5),
                          MyopiaWidgets(widget.height, 'lib/images/myopia6.png',
                              'up', changeIsFilled, saveAnswers6),
                          MyopiaWidgets(widget.height, 'lib/images/myopia7.png',
                              'up', changeIsFilled, saveAnswers7),
                          MyopiaWidgets(widget.height, 'lib/images/myopia8.png',
                              'up', changeIsFilled, saveAnswers8),
                        ][index % 8];
                      },
                    ),
                  ),
                  //SizedBox(height: height*0.01,),
                  // NavigateButtons(
                  //   '',
                  //   'QUIT',
                  //   _isFilled![pos],
                  //   height,
                  //   width,
                  //   context,
                  //   nextPage,
                  //   prevPage,
                  // ),
                  Material(
                    elevation: 10,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        0.1 * width,
                        height * 0.02,
                        0.1 * width,
                        height * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (canFinish) {
                                setState(() {
                                  _isListening = false;
                                  ended = true;
                                });
                                _speech.stop();
                                Navigator.of(context).pop();
                              }
                            },
                            child: Ink(
                              height: 0.06 * height,
                              width: 0.2 * width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'QUIT',
                                  style: TextStyle(
                                    color: (canFinish)
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: (canFinish)
                                        ? FontWeight.w400
                                        : FontWeight.w500,
                                    fontSize: height * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (canFinish) {
                                setState(() {
                                  _isListening = false;
                                  ended = true;
                                });
                                _speech.stop();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyopiaResult(answers: pos)));
                              }
                            },
                            child: Ink(
                              height: 0.06 * height,
                              width: 0.3 * width,
                              decoration: BoxDecoration(
                                color: (canFinish)
                                    ? AppTheme.blue
                                    : HexColor("#E3E3E3"),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'FINISH',
                                  style: TextStyle(
                                    color: (canFinish)
                                        ? AppTheme.white
                                        : AppTheme.nearlyWhite,
                                    fontWeight: (canFinish)
                                        ? FontWeight.w400
                                        : FontWeight.w500,
                                    fontSize: height * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Myopia'),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton:  FloatingActionButton(
    //       onPressed: _listen,
    //       child: Icon(_isListening ? Icons.mic : Icons.mic_none),
    //     ),

    //   body: SingleChildScrollView(
    //     reverse: true,
    //     child: Container(
    //       padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
    // child: Text( _text,
    //   style: const TextStyle(
    //     fontSize: 32.0,
    //     color: Colors.black,
    //     fontWeight: FontWeight.w400,
    //   ),
    // ),
    //     ),
    //   ),
    // );
  }
}
