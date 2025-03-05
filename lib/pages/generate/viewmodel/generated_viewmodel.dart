import 'package:ai_voice_generator/components/dialog/custom_snackBar.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generated_loading_page/view/generate_loading_page_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'generated_viewmodel.g.dart';

class GeneratedViewModel = _GeneratedViewModelBase with _$GeneratedViewModel;

abstract class _GeneratedViewModelBase with Store {
  @observable
  TextEditingController textEditingController = TextEditingController();
  @observable
  int selectedTokenIndex = -1;

  @action
  Future<void> generateButtonTapped(BuildContext context) async {
    if (textEditingController.text.isNotEmpty && selectedTokenIndex != -1) {
      String textFieldValue = textEditingController.text;
      mytextFieldValue = textFieldValue;

      Navigation.push(
        page: const GeneratedLoadingPageView(),
      );
    } else {
      CustomSnackBar.show(
        context: context,
        message: "Make sure you select a character and enter text.",
        containerColor: ColorConstants.red,
        textColor: Colors.white,
      );
      return;
    }
  }

  @observable
  List<GenerateModel> generatePersonList = [
    GenerateModel(
        name: "Trump",
        img: "assets/images/trump.png",
        token: "TM:4v0ft4j72y2g"),
    GenerateModel(
        name: "Obama",
        img: "assets/images/obama.png",
        token: "TM:58vtv7x9f32c"),
    GenerateModel(
        name: "Morgan",
        img: "assets/images/morgan.png",
        token: "TM:xcx5ytjsv8b3"),
    GenerateModel(
        name: "Elon.M",
        img: "assets/images/elon.png",
        token: "TM:fxq6hnfc3rht"),
    GenerateModel(
        name: "Brady",
        img: "assets/images/brady.png",
        token: "TM:fnkmhbrznmeh"),
    GenerateModel(
        name: "A.Tate",
        img: "assets/images/tate.png",
        token: "TM:43c7p13p3z5c"),
    GenerateModel(
        name: "Zendaya",
        img: "assets/images/zendaya.png",
        token: "TM:f5hcw922p29b"),
    GenerateModel(
        name: "Elon.M",
        img: "assets/images/elon.png",
        token: "TM:fxq6hnfc3rht"),
  ];
}

class GenerateModel {
  final String name;
  final String img;
  final String token;
  GenerateModel({
    required this.name,
    required this.img,
    required this.token,
  });
}
