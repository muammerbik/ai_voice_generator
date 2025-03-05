import 'package:ai_voice_generator/components/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/pages/home/view/home_page_view.dart';
import 'package:ai_voice_generator/pages/premium/widgets/premium_gridView_widget.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:ai_voice_generator/pages/premium/widgets/premium_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumView extends StatefulWidget {
  const PremiumView({super.key});

  @override
  State<PremiumView> createState() => _PremiumViewState();
}

class _PremiumViewState extends State<PremiumView> {
  final premiumViewModel = locator<PremiumViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: CustomElevatedButton(
          text: TextConstants.continueBtnText,
          onTop: () async {
            await premiumViewModel.premiumCompletedSet();
            await premiumViewModel.premiumCompletedGet();
            if (premiumViewModel.checkBox &&
                premiumViewModel.premiumCompleted) {
              Navigation.push(
                page: const HomePageView(),
              );
            }
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: Column(
              children: [
                const PremiumGridViewWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child:
                      TextWidgets(text: TextConstants.tryPremium, size: 32.sp),
                ),
                const PremiumTextWidget(
                  text: TextConstants.limitedAds,
                ),
                const PremiumTextWidget(
                  text: TextConstants.usingExamplePrompts,
                ),
                const PremiumTextWidget(
                  text: TextConstants.ReachAllRappers,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Container(
                    width: 350.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          color: ColorConstants.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidgets(
                                text: TextConstants.lifetime, size: 16.sp),
                            const TextWidgets(
                                text: TextConstants.ten$, size: 16),
                          ]),
                      value: premiumViewModel.checkBox,
                      onChanged: (newValue) {
                        setState(
                          () {
                            premiumViewModel.checkBoxFunction(newValue!);
                            premiumViewModel.checkBox = newValue;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
