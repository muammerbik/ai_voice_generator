import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/pages/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  Future<void> init() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    animationController!.forward().whenComplete(
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OnboardingView(),
            ),
          ),
        );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/microphone.png",
                height: 125.w,
                width: 125.w,
              ),
              LinearProgressIndicator(
                  value: animationController?.value ?? 0,
                  backgroundColor: ColorConstants.grey),
            ],
          ),
        ),
      ),
    );
  }
}
