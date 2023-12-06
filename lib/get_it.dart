import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/onbording/viewmodel/onbording_view_model.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/modelview/setting_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setUpGetIt() {
  locator.registerSingleton<SettingsViewModel>(SettingsViewModel());
  locator.registerSingleton<PremiumViewModel>(PremiumViewModel());
  locator.registerSingleton<OnbordingViewModel>(OnbordingViewModel());
  locator.registerSingleton<GeneratedViewModel>(GeneratedViewModel());
}
