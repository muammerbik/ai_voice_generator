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
}
