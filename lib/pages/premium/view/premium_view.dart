import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/home_page/view/home_page_view.dart';

import 'package:ai_voice_generator/pages/premium/widgets/premium_stack_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/until/row_until.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PremiumView extends StatefulWidget {
  const PremiumView({super.key});

  @override
  State<PremiumView> createState() => _PremiumViewState();
}

class _PremiumViewState extends State<PremiumView> {
  final myPremiumViewModel = PremiumViewModel();

  bool myPrem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              PremiumStackView(),
              SizedBox(height: 30),
              TextUntil.buildTextWidget(TextConstants.tryPremium, 34,
                  ColorConstants.black, TextConstants.poppins, FontWeight.w700),
              RowUntil().premiumRowMethod(TextConstants.limitedAds),
              RowUntil().premiumRowMethod(
                TextConstants.usingExamplePrompts,
              ),
              RowUntil().premiumRowMethod(TextConstants.ReachAllRappers),
              SizedBox(height: 10),
              Container(
                width: 350,
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xFF4E55FF)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: CheckboxListTile(
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUntil.buildTextWidget(
                            TextConstants.lifetime,
                            17,
                            ColorConstants.black,
                            TextConstants.sfProText,
                            FontWeight.w600),
                        TextUntil.buildTextWidget(
                            TextConstants.ten$,
                            16,
                            ColorConstants.black,
                            TextConstants.sfProText,
                            FontWeight.w600),
                      ]),
                  value: myPremiumViewModel.checkBox,
                  onChanged: (newvalue) {
                    setState(() {
                      myPremiumViewModel.checkBoxFunction(newvalue!);
                      myPremiumViewModel.checkBox = newvalue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButtonView(
                onTop: () async {
                  await myPremiumViewModel.premiumComplatedSet();
                  await myPremiumViewModel.premiumComplatedGet();

                  if (myPremiumViewModel.checkBox &&
                      myPremiumViewModel.premiumComplated) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePageView(),
                    ));
                  }
                },
                text: TextConstants.continuee,
              )
            ],
          );
        },
      ),
    );
  }
}
