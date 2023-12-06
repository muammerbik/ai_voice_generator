import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
import 'package:ai_voice_generator/pages/premium/view/premium_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/modelview/setting_view_model.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final settingsGetIt = locator<SettingsViewModel>();
  final premiumGetIt = locator<PremiumViewModel>();

  @override
  Widget build(BuildContext context) {
    //  settingsGetIt.settingsComplatedSet();
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: CustomAppbarView(
            onPressed: () {
              Navigator.of(context).pop();
            },
            appBarTitle: TextConstants.appBarTitleSetting,
            appbarImage: "assets/icons/left2.png",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Container(
              height: 310,
              width: 203,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  premiumGetIt.premiumComplated == false
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PremiumView(),
                              ),
                            );
                          },
                          child: TextUntil.buildTextWidget(
                              TextConstants.premiumText,
                              20,
                              Colors.white,
                              TextConstants.poppins,
                              FontWeight.w500),
                        )
                      : Text(""),
                  TextUntil.buildTextWidget(TextConstants.shareApp, 20,
                      Colors.white, TextConstants.poppins, FontWeight.w500),
                  TextUntil.buildTextWidget(TextConstants.rateUs, 20,
                      Colors.white, TextConstants.poppins, FontWeight.w500),
                  TextUntil.buildTextWidget(TextConstants.contactUs, 20,
                      Colors.white, TextConstants.poppins, FontWeight.w500),
                  TextUntil.buildTextWidget(TextConstants.termsOfService, 20,
                      Colors.white, TextConstants.poppins, FontWeight.w500),
                  TextUntil.buildTextWidget(TextConstants.privacyPolicy, 20,
                      Colors.white, TextConstants.poppins, FontWeight.w500),
                  Observer(
                    builder: (_) {
                      return premiumGetIt.premiumComplated == false &&
                              settingsGetIt.premiumRight >0
                          ? TextUntil.buildTextWidget(
                              "Remaining Usage: ${settingsGetIt.premiumRight}",
                              20,
                              Colors.grey,
                              TextConstants.poppins,
                              FontWeight.w500)
                          : Text("");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
