import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/pages/home/view/home_page_view.dart';
import 'package:ai_voice_generator/pages/onboarding/view/onboarding_view.dart';
import 'package:ai_voice_generator/pages/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/splash/splash_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (mounted) {
      Navigation.pushReplace(page: const MainView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final onboardingViewModel = locator<OnboardingViewModel>();
  final premiumViewModel = locator<PremiumViewModel>();

  @override
  initState() {
    onboardingViewModel.onboardingCompletedGet();

    premiumViewModel.premiumCompletedGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (onboardingViewModel.onboardingCompleted == true &&
            premiumViewModel.premiumCompleted == true) {
          return const HomePageView();
        } else if (onboardingViewModel.onboardingCompleted == true) {
          return const PremiumView();
        } else {
          return const OnboardingView();
        }
      },
    );
  }
}
