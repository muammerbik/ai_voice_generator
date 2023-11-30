import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/generate_model.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/generated_loading_page_view/view/generate_loading_page_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/setting_view_model.dart';
import 'package:ai_voice_generator/services/fakeyou_%20api_services.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                      side: BorderSide(
                        width: 1,
                        color: Color(0x5B3C3C43),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                          // Seçilen tokenin indeksini güncelle
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
                              // Kenar rengini ve kalınlığını seçilen tokena göre ayarla
                              border: Border.all(
                                color: selectedTokenIndex == index
                                    ? Colors.blue // Seçilen tokenın kenar rengi
                                    : Colors
                                        .black, // Seçilmeyen tokenların kenar rengi
                                width: 4,
                              ),
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

               
                  
                    generateViewModel
                        .generatePersonList[selectedTokenIndex].token;
                
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GeneratedLoadingPageView(),
                    ),
                  );
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
