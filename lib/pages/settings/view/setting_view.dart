import 'package:ai_voice_generator/components/custom_appBar/custom_appBar.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/settings/widgets/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  final premiumGetIt = locator<PremiumViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: CustomAppBarView(
            appBarTitle: TextConstants.appBarTitleSetting,
            centerTitle: true,
            leadingIcon: IconButton(
              onPressed: () {
                Navigation.ofPop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.white,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSettingsButton(
                title: TextConstants.shareApp,
                onTap: () {},
              ),
              CustomSettingsButton(
                title: TextConstants.rateUs,
                onTap: () {},
              ),
              CustomSettingsButton(
                title: TextConstants.contactUs,
                onTap: () {},
              ),
              CustomSettingsButton(
                title: TextConstants.termsOfService,
                onTap: () {},
              ),
              CustomSettingsButton(
                title: TextConstants.privacyPolicy,
                onTap: () {},
              ),
              CustomSettingsButton(
                title: TextConstants.premiumText,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
