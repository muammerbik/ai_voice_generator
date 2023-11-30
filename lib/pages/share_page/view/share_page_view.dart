import 'dart:async';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_audio/just_audio.dart';

class SharePageView extends StatefulWidget {
  const SharePageView({Key? key}) : super(key: key);

  @override
  _SharePageViewState createState() => _SharePageViewState();
}

class _SharePageViewState extends State<SharePageView> {
  final generatedViewModel = GeneratedViewModel();
  double sliderValue = 0;
  double maxValue = 1;
  late AudioPlayer _audioPlayer;
  late Stream<Duration> _positionStream;
  bool isPlaying = false;
  bool shouldAutoStart = true;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _loadAudio();
    _positionStream = _audioPlayer.positionStream;
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        sliderValue = position.inMilliseconds.toDouble();
      });
      if (position >= _audioPlayer.duration!) {
        setState(() {
          sliderValue = 0;
          isPlaying = false;
          shouldAutoStart =
              false; // Ses dosyası tamamlandığında otomatik başlamasını önle
          _loadAudio();
        });
      }
    });

    super.initState();
  }

  Future<void> _loadAudio() async {
    final duration = await _audioPlayer.setUrl(tokenUrl);
    setState(() {
      maxValue = duration!.inMilliseconds.toDouble();
    });
  }

  void _seekForward() {
    _audioPlayer.seek(
        Duration(milliseconds: _audioPlayer.position.inMilliseconds + 1000));
  }

  void _seekBackward() {
    _audioPlayer.seek(
        Duration(milliseconds: _audioPlayer.position.inMilliseconds - 1000));
  }

  void _startAudio() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      if (sliderValue >= maxValue) {
        _audioPlayer.seek(Duration(milliseconds: 0));
        setState(() {
          sliderValue = 0;
          shouldAutoStart =
              true; // Başa alındığında otomatik başlamasına izin ver
        });
      }
      if (shouldAutoStart) {
        _audioPlayer.play();
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Page'),
      ),
      body: Observer(
        builder: (context) => Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                width: 182,
                height: 193,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(color: Colors.black, width: 4),
                  image: DecorationImage(
                    image: AssetImage(
                        generatedViewModel.generatePersonList[myIndex].img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'App Bar Title',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF1C1C1E),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Text(
                generatedViewModel.generatePersonList[myIndex].name,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                value: sliderValue,
                min: 0,
                max: maxValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                  _audioPlayer.seek(Duration(milliseconds: value.toInt()));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: _seekBackward,
                    icon: Image.asset(
                      "assets/icons/geri.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: _startAudio,
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/oynat.png",
                          height: 90,
                          width: 80,
                        ),
                        Positioned(
                          bottom: 35,
                          child: Image.asset(
                            isPlaying
                                ? "assets/icons/pause_button.png"
                                : "assets/icons/play_button.png",
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: _seekForward,
                    icon: Image.asset(
                      "assets/icons/ileri.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 130,
              ),
              CustomElevatedButtonView(text: "Share", onTop: () {})
            ],
          ),
        ),
      ),
    );
  }
}
