import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'setting_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  @observable
  int premiumRight = 2;

  @action
  Future<int> settingsComplatedSet() async {
    final prefs = await SharedPreferences.getInstance();
    var right = await settingsComplatedGet();
    if (right > 0) {
      right--;
      await prefs.setInt('premiumRight', right);
    }
    premiumRight = right;
    return right;
  }

  @action
  Future<int> settingsComplatedGet() async {
    final prefs = await SharedPreferences.getInstance();
    premiumRight = prefs.getInt('premiumRight') ?? 2;
    return premiumRight;
  }
}
