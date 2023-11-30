import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/onbording/viewmodel/onbording_view_model.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';

import 'package:ai_voice_generator/until/text_until.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({Key? key}) : super(key: key);

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final myOnbordingViewModel = OnbordingViewModel();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              SizedBox(height: 130),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Image.asset(
                  "assets/images/microphone.png",
                  height: 160,
                  width: 160,
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 292,
                child: TextUntil.buildTextWidget(
                  TextConstants.onbordingText1,
                  34,
                  ColorConstants.black,
                  TextConstants.poppins,
                  FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 350,
                child: TextUntil.buildTextWidget(
                  TextConstants.onbordingText2,
                  20,
                  ColorConstants.black,
                  TextConstants.poppins,
                  FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              TextUntil.buildTextWidget(
                TextConstants.onbordingText3,
                17,
                ColorConstants.black,
                TextConstants.sfProText,
                FontWeight.w600,
              ),
              SizedBox(height: 40),
              CustomElevatedButtonView(
                onTop: () async {
                  await myOnbordingViewModel.onbordingComplatedSet();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PremiumView(),
                    ),
                  );
                },
                text: TextConstants.continuee,
              ),
              SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
