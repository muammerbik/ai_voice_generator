import 'dart:async';
import 'package:ai_voice_generator/companents/custom_appBar/custom_appBar.dart';
import 'package:ai_voice_generator/companents/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

class VoiceGeneratorPageView extends StatefulWidget {
  const VoiceGeneratorPageView({Key? key}) : super(key: key);

  @override
  _VoiceGeneratorPageViewState createState() => _VoiceGeneratorPageViewState();
}

class _VoiceGeneratorPageViewState extends State<VoiceGeneratorPageView> {
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
    
    // Player durumunu dinle
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          isPlaying = false;
          sliderValue = 0;
          shouldAutoStart = false;
        });
      }
    });

    // Pozisyon değişikliklerini dinle
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        sliderValue = position.inMilliseconds.toDouble();
      });
      // Duration null check eklendi
      if (_audioPlayer.duration != null && 
          position >= _audioPlayer.duration!) {
        setState(() {
          sliderValue = 0;
          isPlaying = false;
          shouldAutoStart = false;
        });
      }
    });

    _loadAudio();
    super.initState();
  }

  Future<void> _loadAudio() async {
    try {
      if (tokenUrl.isEmpty) {
        debugPrint('Audio URL is empty');
        return;
      }

      // HTTP headers ekle
      final duration = await _audioPlayer.setUrl(
        tokenUrl,
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': '*/*',
        },
      );

      if (duration == null) {
        debugPrint('Failed to load audio - duration is null');
        return;
      }

      setState(() {
        maxValue = duration.inMilliseconds.toDouble();
      });
    } catch (e) {
      debugPrint('Error loading audio: $e');
      // Kullanıcıya hata göster
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ses yüklenirken hata oluştu: $e')),
        );
      }
    }
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

  void _startAudio() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        // Duration null check eklendi
        if (_audioPlayer.duration != null &&
            _audioPlayer.position >= _audioPlayer.duration!) {
          await _audioPlayer.seek(Duration.zero);
          setState(() {
            sliderValue = 0;
            shouldAutoStart = true;
          });
        }
        await _audioPlayer.play();
      }

      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      debugPrint('Error playing audio: $e');
      // Kullanıcıya hata göster
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ses oynatılırken hata oluştu: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: /*  CustomAppbarView(
        appBarTitle: TextConstants.appBarTitle,
        appbarImage: "assets/icons/left2.png",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePageView(),
          ));
        },
      ), */
          CustomAppBarView(
        appBarTitle: TextConstants.appBarTitle,
        centerTitle: true,
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
              /*   CustomElevatedButtonView(
                text: "Share",
                onTop: () {
                  Share.share(tokenUrl);
                },
              ) */
              CustomElevatedButton(
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
