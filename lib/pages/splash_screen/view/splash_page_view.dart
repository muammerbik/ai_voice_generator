import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
import 'package:ai_voice_generator/pages/home_page/view/home_page_view.dart';
import 'package:ai_voice_generator/pages/onbording/view/onbording_view.dart';
import 'package:ai_voice_generator/pages/onbording/viewmodel/onbording_view_model.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/modelview/setting_view_model.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  final premiumGetIt = locator<PremiumViewModel>();
  final mySettingsViewModel = SettingsViewModel();
  final onbordingGetIt = locator<OnbordingViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  Future<void> init() async {
    await onbordingGetIt.onbordingComplatedGet();
    await premiumGetIt.premiumComplatedGet();
    await mySettingsViewModel.settingsComplatedGet();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    if (onbordingGetIt.onbordingComplated && premiumGetIt.premiumComplated) {
      animationController!
          .forward()
          .whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePageView(),
              )));
    } else if (onbordingGetIt.onbordingComplated) {
      animationController!
          .forward()
          .whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PremiumView(),
              )));
    } else {
      animationController!
          .forward()
          .whenComplete(() => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OnbordingView(),
              )));
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/microphone.png",
            height: 125,
            width: 125,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: LinearProgressIndicator(
                value: animationController?.value ?? 0,
                backgroundColor: ColorConstants.grey),
          ),
        ],
      ),
    );
  }
}
