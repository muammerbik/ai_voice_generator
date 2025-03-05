import 'package:ai_voice_generator/companents/custom_appBar/custom_appBar.dart';
import 'package:ai_voice_generator/companents/custom_button/custom_elevated_button.dart';
import 'package:ai_voice_generator/companents/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/companents/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/generated_loading_page_view/view/generate_loading_page_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerateView extends StatefulWidget {
  const GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView> {
  final premiumGetIt = locator<PremiumViewModel>();
  final generateGetIt = locator<GeneratedViewModel>();
  TextEditingController textEditingController = TextEditingController();
  int selectedTokenIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: CustomElevatedButton(
              text: TextConstants.generate,
              onTop: () async {
                if (textEditingController.text.isNotEmpty &&
                    selectedTokenIndex != -1) {
                  String textFieldValue = textEditingController.text;
                  mytextFieldValue = textFieldValue;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GeneratedLoadingPageView(),
                    ),
                  );
                }
              },
            ),
          ),
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBarView(
            appBarTitle: TextConstants.appBarTitle,
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets(
                    text: TextConstants.whatShouldAiCharacter, size: 16.sp),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  child: Container(
                    height: 200.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                        side: const BorderSide(
                            width: 1, color: ColorConstants.borderColor),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: TextField(
                        maxLines: 5,
                        maxLength: 250,
                        textInputAction: TextInputAction.done,
                        controller: textEditingController,
                        style: const TextStyle(
                          color: ColorConstants.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: TextConstants.writeYourPrompts,
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidgets(
                          text: TextConstants.selectAiVoice, size: 16.sp),
                      TextWidgets(text: TextConstants.seeAll, size: 16.sp),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
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
                              width: 78.w,
                              height: 78.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90.r),
                                border: Border.all(
                                  color: selectedTokenIndex == index
                                      ? const Color(0xFF4E55FF)
                                      : Colors.grey.withOpacity(0.2),
                                  width: 4.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage(generateGetIt
                                      .generatePersonList[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            TextWidgets(
                                text: generateGetIt
                                    .generatePersonList[index].name,
                                size: 10),
                          ],
                        ),
                      );
                    },
                    itemCount: generateGetIt.generatePersonList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisCount: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
