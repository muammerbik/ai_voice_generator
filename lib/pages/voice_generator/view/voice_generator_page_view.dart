import 'package:ai_voice_generator/components/custom_appBar/custom_appBar.dart';
import 'package:ai_voice_generator/components/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/home/view/home_page_view.dart';
import 'package:ai_voice_generator/pages/voice_generator/viewmodel/voice_generator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class VoiceGeneratorPageView extends StatefulWidget {
  const VoiceGeneratorPageView({Key? key}) : super(key: key);

  @override
  _VoiceGeneratorPageViewState createState() => _VoiceGeneratorPageViewState();
}

class _VoiceGeneratorPageViewState extends State<VoiceGeneratorPageView> {
  final generateGetIt = locator<GeneratedViewModel>();
  final voiceGeneratorViewModel = locator<VoiceGeneratorViewModel>();

  @override
  void initState() {
    voiceGeneratorViewModel.initAudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    voiceGeneratorViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: CustomElevatedButton(
          text: "Share",
          onTop: () {
            Share.share(tokenUrl);
          },
        ),
      ),
      appBar: CustomAppBarView(
        appBarTitle: TextConstants.appBarTitle,
        centerTitle: true,
        leadingIcon: IconButton(
          onPressed: () {
            Navigation.pushAndRemoveAll(
              page: const HomePageView(),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.white,
          ),
        ),
      ),
      body: Observer(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(190),
                  border: Border.all(
                      color: ColorConstants.buttonPurpleColor, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                        generateGetIt.generatePersonList[myIndex].img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: TextWidgets(
                  text: TextConstants.appBarTitle,
                  size: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextWidgets(
                  text: generateGetIt.generatePersonList[myIndex].name,
                  size: 20),
              Slider(
                value: voiceGeneratorViewModel.sliderValue,
                min: 0,
                max: voiceGeneratorViewModel.maxValue,
                onChanged: voiceGeneratorViewModel.updateSliderValue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: voiceGeneratorViewModel.seekBackward,
                    icon: Image.asset(
                      "assets/icons/geri.png",
                      height: 40.h,
                      width: 40.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  GestureDetector(
                    onTap: voiceGeneratorViewModel.startAudio,
                    child: Container(
                      height: 81.h,
                      width: 81.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            ColorConstants.buttonPurpleColor,
                            ColorConstants.buttonBlueColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        voiceGeneratorViewModel.isPlaying
                            ? "assets/icons/pause_button.png"
                            : "assets/icons/play_button.png",
                        height: 36.h,
                        width: 36.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: voiceGeneratorViewModel.seekForward,
                    icon: Image.asset(
                      "assets/icons/ileri.png",
                      height: 40.h,
                      width: 40.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
