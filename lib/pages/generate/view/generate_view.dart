import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/generated_loading_page_view/view/generate_loading_page_view.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/modelview/setting_view_model.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class GenerateView extends StatefulWidget {
  const GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView> {
  final mySettingsViewModel = SettingsViewModel();
  final myPremiumViewModel = PremiumViewModel();
  TextEditingController textEditingController = TextEditingController();
  final generateViewModel = GeneratedViewModel();
  int selectedTokenIndex = -1;

  Future<bool> premiumComplatedGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('premiumComplated') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppbarView(
            onPressed: () {
              Navigator.of(context).pop();
            },
            appBarTitle: TextConstants.appBarTitle,
            appbarImage: "assets/icons/geriIcon.png",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                child: TextUntil.buildTextWidget(
                  TextConstants.whatShouldAiCharacter,
                  17,
                  Colors.black,
                  TextConstants.poppins,
                  FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                child: Container(
                  height: 190,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(width: 1, color: Color(0xFF4E55FF)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction:TextInputAction.done ,
                      controller: textEditingController,
                      maxLength: 250,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: TextConstants.writeYourPrompts,
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUntil.buildTextWidget(
                      TextConstants.selectAiVoice,
                      17,
                      Colors.black,
                      TextConstants.sfProText,
                      FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/Message.png",
                        height: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTokenIndex = index;
                          myIndex = selectedTokenIndex;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 78,
                            height: 78,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              border: Border.all(
                                color: selectedTokenIndex == index
                                    ? Color(0xFF4E55FF)
                                    : Colors.black.withOpacity(0.2),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(generateViewModel
                                    .generatePersonList[index].img),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            generateViewModel.generatePersonList[index].name,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: generateViewModel.generatePersonList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 29,
                    crossAxisCount: 4,
                  ),
                ),
              ),
              CustomElevatedButtonView(
                onTop: () async {
                  String textFieldValue = textEditingController.text;
                  mytextFieldValue = textFieldValue;

                  final remainingRights =
                      await mySettingsViewModel.settingsComplatedGet();
                  final premiumComplated = await premiumComplatedGet();
                  if (premiumComplated || remainingRights > 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GeneratedLoadingPageView(),
                      ),
                    );

                    await mySettingsViewModel.settingsComplatedSet();
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PremiumView(),
                      ),
                    );
                  }
                },
                text: TextConstants.generate,
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        );
      },
    );
  }
}
