import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:health_predictor/common/GradientProgressBar.dart';
import 'package:health_predictor/common/MyopiaWidgets.dart';
import 'package:health_predictor/common/navigate_buttons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../app_theme.dart';
import 'MyopiaResult.dart';

class Myopia extends StatefulWidget {
  Myopia({Key? key}) : super(key: key);

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
  int pos = 0;
  List<bool>? _isFilled;
  List<dynamic> answers = [
    ['down', 'down', 'left', 'right', 'up', 'down', 'left', 'right']
  ];
  String? selectedMcq;
  bool? showPopup;
  String ques = 'What number do you see?';
  List choices = ['up', 'down', 'left', 'right'];

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
    } else {
      //test finish code
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyopiaResult(answers: answers)));
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
  }

  playLocal() async {
    AudioPlayer audioPlayer = await cache.play("myopia_audio.mp3");
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.PAUSED ||
          s == PlayerState.STOPPED ||
          s == PlayerState.COMPLETED) {
        _listen();
      }
    });
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    super.initState();
    _speech = stt.SpeechToText();
  }

  /// Each time to start a speech recognition session
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(onStatus: (val) {
        print('onStatus: $val');
        if (val == 'done') {
          print(_text);
          _isListening = false;
          for (var s in choices) {
            if (_text.toLowerCase().contains(s)) {
              if (answers[pos] == s) {
                nextPage();
              } else {}
            } else {
              playLocal();
            }
          }
        }
      }, onError: (val) {
        print('onError: $val');
        _isListening = false;
      });
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: Duration(minutes: 5),
          pauseFor: Duration(seconds: 10),
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
    answers[0] = level;
    // });
  }

  void saveAnswers2(String level) {
    // setState(() {
    answers[1] = level;
    // });
  }

  void saveAnswers3(String level) {
    // setState(() {
    answers[2] = level;
    // });
  }

  void saveAnswers4(String level) {
    // setState(() {
    answers[3] = level;
    // });
  }

  void saveAnswers5(String level) {
    // setState(() {
    answers[4] = level;
    // });
  }

  void saveAnswers6(String level) {
    // setState(() {
    answers[5] = level;
    // });
  }

  void saveAnswers7(String level) {
    // setState(() {
    answers[6] = level;
    // });
  }

  void saveAnswers8(String level) {
    // setState(() {
    answers[7] = level;
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
                            "Plate " + (pos + 1).toString() + "/8",
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
                          MyopiaWidgets('lib/images/myopia1.png', 'up',
                              changeIsFilled, saveAnswers1),
                          MyopiaWidgets('lib/images/myopia2.png', 'up',
                              changeIsFilled, saveAnswers2),
                          MyopiaWidgets('lib/images/myopia3.png', 'up',
                              changeIsFilled, saveAnswers3),
                          MyopiaWidgets('lib/images/myopia4.png', 'up',
                              changeIsFilled, saveAnswers4),
                          MyopiaWidgets('lib/images/myopia5.png', 'up',
                              changeIsFilled, saveAnswers5),
                          MyopiaWidgets('lib/images/myopia6.png', 'up',
                              changeIsFilled, saveAnswers6),
                          MyopiaWidgets('lib/images/myopia7.png', 'up',
                              changeIsFilled, saveAnswers7),
                          MyopiaWidgets('lib/images/myopia8.png', 'up',
                              changeIsFilled, saveAnswers8),
                        ][index % 8];
                      },
                    ),
                  ),
                  //SizedBox(height: height*0.01,),
                  NavigateButtons(
                    pos != 7 ? 'NEXT' : 'FINISH',
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
