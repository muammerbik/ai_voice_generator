import 'dart:async';
import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/home_page/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

class SharePageView extends StatefulWidget {
  const SharePageView({Key? key}) : super(key: key);

  @override
  _SharePageViewState createState() => _SharePageViewState();
}

class _SharePageViewState extends State<SharePageView> {
  //final generatedViewModel = GeneratedViewModel();
  final generateGetIt = locator<GeneratedViewModel>();
  double sliderValue = 0;
  double maxValue = 1;
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  bool shouldAutoStart = true;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _loadAudio();
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        sliderValue = position.inMilliseconds.toDouble();
      });
      if (position >= _audioPlayer.duration!) {
        setState(() {
          sliderValue = 0;
          isPlaying = false;
          shouldAutoStart = false;
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
    if (shouldAutoStart) {
      _audioPlayer.seek(
          Duration(milliseconds: _audioPlayer.position.inMilliseconds + 1000));
    }
  }

  void _seekBackward() {
    if (shouldAutoStart) {
      const geriSarMiktari = 1000;
      final yeniPozisyon =
          _audioPlayer.position.inMilliseconds - geriSarMiktari;

      if (yeniPozisyon >= 0) {
        _audioPlayer.seek(Duration(milliseconds: yeniPozisyon));
        setState(() {
          sliderValue = yeniPozisyon.toDouble();
        });
      } else {
        _audioPlayer.seek(Duration.zero);
        setState(() {
          sliderValue = 0;
        });
      }
    }
  }

  void _startAudio() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      if (_audioPlayer.position.inMilliseconds >=
          _audioPlayer.duration!.inMilliseconds) {
        _audioPlayer.seek(Duration.zero);
        setState(() {
          sliderValue = 0;
          shouldAutoStart = true;
        });
      }
      _audioPlayer.play();
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
      appBar: CustomAppbarView(
        appBarTitle: TextConstants.appBarTitle,
        appbarImage: "assets/icons/left2.png",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePageView(),
          ));
        },
      ),
      body: Observer(
        builder: (context) => Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 182,
                height: 193,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(190),
                  border: Border.all(
                      color: ColorConstants.buttonPurpleColor, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Gölge rengi
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // Gölgenin konumu (x, y)
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                        generateGetIt.generatePersonList[myIndex].img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                TextConstants.appBarTitle,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                generateGetIt.generatePersonList[myIndex].name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                value: sliderValue,
                min: 0,
                max: maxValue,
                onChanged: (value) {
                  if (shouldAutoStart) {
                    setState(() {
                      sliderValue = value;
                    });
                    _audioPlayer.seek(Duration(milliseconds: value.toInt()));
                  }
                },
              ),
              const SizedBox(height: 15),
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
                  GestureDetector(
                    onTap: _startAudio,
                    child: Stack(
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
              const SizedBox(
                height: 110,
              ),
              CustomElevatedButtonView(
                text: "Share",
                onTop: () {
                  Share.share(tokenUrl);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
