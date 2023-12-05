import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'premium_view_model.g.dart';

class PremiumViewModel = _PremiumViewModelBase with _$PremiumViewModel;

abstract class _PremiumViewModelBase with Store {
  @observable
  bool premiumComplated = false;

  @observable
  bool checkBox = false;

  @action
  Future<void> premiumComplatedSet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('premiumComplated', true);
    premiumComplated = true;
  }

  @observable
  List<String> imageModel = [
    "assets/images/img_premium1.png",
    "assets/images/img_premium2.png",
    "assets/images/img_premium3.png",
    "assets/images/img_premium4.png",
  ];

  @action
  Future<void> premiumComplatedGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    premiumComplated = prefs.getBool('premiumComplated') ?? false;
  }

  @action
  void checkBoxFunction(bool value) {
    checkBox = value;
  }
}
