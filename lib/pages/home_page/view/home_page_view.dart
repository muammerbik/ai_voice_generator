import 'package:ai_voice_generator/companents/custom_appbar_view.dart';
import 'package:ai_voice_generator/companents/custom_elevated_button_view.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/generate/view/generate_view.dart';
import 'package:ai_voice_generator/pages/settings/view/setting_view.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: CustomAppbarView(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsView(),
              ));
            },
            appBarTitle: TextConstants.appBarTitle,
            appbarImage: "assets/icons/stng.png",
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              TextUntil.buildTextWidget(TextConstants.startHere, 34,
                  Colors.white, TextConstants.poppins, FontWeight.w700),
              // SizedBox(height: 20),
              TextUntil.buildTextWidget(TextConstants.HomeTextDown, 17,
                  ColorConstants.white, TextConstants.poppins, FontWeight.w400),
              const SizedBox(height: 50),
              Image.asset(
                "assets/images/down1.png",
                height: 170,
              ),
              const SizedBox(height: 90),
              CustomElevatedButtonView(
                  onTop: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GenerateView(),
                    ));
                  },
                  text: TextConstants.generate),
            ],
          ),
        );
      },
    );
  }
}
