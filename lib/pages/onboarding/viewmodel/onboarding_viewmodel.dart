import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onboarding_viewmodel.g.dart';

class OnboardingViewModel = _OnboardingViewModelBase with _$OnboardingViewModel;

abstract class _OnboardingViewModelBase with Store {
  @observable
  bool onboardingCompleted = false;

  @action
  Future<void> onboardingCompletedSet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('onboardingCompleted', true);
  }

  @action
  Future<void> onboardingCompletedGet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingCompleted = preferences.getBool('onboardingCompleted') ?? false;
  }

  @action
  Future<void> continueButtonTapped() async {
    await onboardingCompletedSet();
    await onboardingCompletedGet();
    if (onboardingCompleted) {
    Navigation.pushAndRemoveAll(page: const PremiumView());
  }
  }
}
