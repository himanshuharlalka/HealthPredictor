import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
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
  @override
  void initState() {
    super.initState();
    _initSpeech();
    playLocal();
  }
  playLocal() async {
    AudioPlayer audioPlayer= await cache.play("myopia_audio.mp3");
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) { if(s==PlayerState.PAUSED||s==PlayerState.STOPPED||s==PlayerState.COMPLETED){
      _listen();
    }});

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
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: Duration(minutes: 5),
          pauseFor: Duration(seconds: 10),
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myopia'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text( _text,
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
