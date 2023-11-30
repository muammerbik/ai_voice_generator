import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onbording_view_model.g.dart';

class OnbordingViewModel = _OnbordingViewModelBase with _$OnbordingViewModel;

abstract class _OnbordingViewModelBase with Store {
  @observable
  bool onbordingComplated = false;

  @action
  Future<void> onbordingComplatedSet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onbordingComplated', true);
  }

  @action
  Future<void> onbordingComplatedGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onbordingComplated = prefs.getBool('onbordingComplated') ?? false;

  }
}
