import 'package:ai_voice_generator/components/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final onboardingViewModel = locator<OnboardingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: CustomElevatedButton(
          text: TextConstants.continueBtnText,
          onTop: () {
            onboardingViewModel.continueButtonTapped();
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Image.asset(
                    "assets/images/microphone.png",
                    height: 128.h,
                    width: 128.h,
                    fit: BoxFit.cover,
                  ),
                ),
                TextWidgets(text: TextConstants.onboardingText1, size: 30.sp),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: TextWidgets(
                    text: TextConstants.onboardingText2,
                    size: 20.sp,
                  ),
                ),
                TextWidgets(text: TextConstants.onboardingText3, size: 17.sp),
              ],
            ),
          );
        },
      ),
    );
  }
}
