import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setUpGetIt() {
  locator.registerSingleton<PremiumViewModel>(PremiumViewModel());
  locator.registerSingleton<OnboardingViewModel>(OnboardingViewModel());
  locator.registerSingleton<GeneratedViewModel>(GeneratedViewModel());
}
