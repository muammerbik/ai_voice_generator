import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/settings/setting_view_model.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsViewModel _settingsViewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: CustomAppbarView(
            onPressed: () {
              Navigator.of(context).pop();
            },
            appBarTitle: TextConstants.appBarTitleSetting,
            appbarImage: "assets/icons/geriIcon.png",
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
                    TextUntil.buildTextWidget(TextConstants.premiumText, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    TextUntil.buildTextWidget(TextConstants.shareApp, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    TextUntil.buildTextWidget(TextConstants.rateUs, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    TextUntil.buildTextWidget(TextConstants.contactUs, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    TextUntil.buildTextWidget(TextConstants.termsOfService, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    TextUntil.buildTextWidget(TextConstants.privacyPolicy, 20,
                        Colors.black, TextConstants.poppins, FontWeight.w500),
                    Observer(builder: (_) {
                      return TextUntil.buildTextWidget(
                          "Remaining Usage: ${_settingsViewModel.premiumRight}",
                          20,
                          Colors.grey,
                          TextConstants.poppins,
                          FontWeight.w500);
                    }),
                  ],
                )),
          ),
        );
      },
    );
  }
}
