import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
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

class GenerateView extends StatefulWidget {
  const GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView> {
  final settingsGetIt = locator<SettingsViewModel>();
  final premiumGetIt = locator<PremiumViewModel>();
  final generateGetIt = locator<GeneratedViewModel>();
  TextEditingController textEditingController = TextEditingController();
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
            appbarImage: "assets/icons/left2.png",
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
                  Colors.white,
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
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5,
                      maxLength: 250,
                      textInputAction: TextInputAction.done,
                      controller: textEditingController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: TextConstants.writeYourPrompts,
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.white, // Metin rengi: Beyaz
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
                      Colors.white,
                      TextConstants.sfProText,
                      FontWeight.w600,
                    ),
                    TextUntil.buildTextWidget(
                      "SeeAll",
                      17,
                      Colors.white,
                      TextConstants.sfProText,
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
                                    : Colors.grey.withOpacity(0.2),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(generateGetIt
                                    .generatePersonList[index].img),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            generateGetIt.generatePersonList[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: generateGetIt.generatePersonList.length,
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
                      await settingsGetIt.settingsComplatedGet();
                  final premiumComplated = await premiumComplatedGet();
                  if (premiumComplated || remainingRights > 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GeneratedLoadingPageView(),
                      ),
                    );

                    await settingsGetIt.settingsComplatedSet();
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
