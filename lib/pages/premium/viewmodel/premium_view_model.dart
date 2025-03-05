import 'package:ai_voice_generator/components/dialog/custom_snackBar.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/pages/home/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'premium_view_model.g.dart';

class PremiumViewModel = _PremiumViewModelBase with _$PremiumViewModel;

abstract class _PremiumViewModelBase with Store {
  @observable
  bool premiumCompleted = false;

  @observable
  bool checkBox = false;

  @action
  Future<void> premiumCompletedSet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('premiumCompleted', true);
    premiumCompleted = true;
  }

  @action
  Future<void> premiumCompletedGet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    premiumCompleted = preferences.getBool('premiumCompleted') ?? false;
  }

  @action
  Future<void> premiumButtonTapped(BuildContext context) async {
    await premiumCompletedSet();
    await premiumCompletedGet();
    if (checkBox && premiumCompleted) {
      Navigation.pushAndRemoveAll(
        page: const HomePageView(),
      );
    } else {
      CustomSnackBar.show(
        context: context,
        message: "Select premium plan to see the opportunities",
        containerColor: ColorConstants.red,
        textColor: Colors.white,
      );
      return;
    }
  }

  @observable
  List<String> imageModel = [
    "assets/images/img_premium1.png",
    "assets/images/img_premium2.png",
    "assets/images/img_premium3.png",
    "assets/images/img_premium4.png",
  ];

  @action
  void checkBoxFunction(bool value) {
    checkBox = value;
  }
}
