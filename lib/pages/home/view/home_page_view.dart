import 'package:ai_voice_generator/components/custom_appBar/custom_appBar.dart';
import 'package:ai_voice_generator/components/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/pages/generate/view/generate_view.dart';
import 'package:ai_voice_generator/pages/settings/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: CustomElevatedButton(
              text: TextConstants.generate,
              onTop: () {
                Navigation.push(
                  page: const GenerateView(),
                );
              },
            ),
          ),
          appBar: CustomAppBarView(
            appBarTitle: TextConstants.appBarTitle,
            centerTitle: true,
            actionIcons: [
              IconButton(
                onPressed: () {
                  Navigation.push(
                    page: const SettingsView(),
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  color: ColorConstants.white,
                ),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidgets(text: TextConstants.startHere, size: 32.sp),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: const TextWidgets(
                      text: TextConstants.HomeTextDown, size: 18),
                ),
                Image.asset(
                  "assets/images/down1.png",
                  height: 170.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
