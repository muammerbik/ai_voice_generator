import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/voice_generator/view/voice_generator_page_view.dart';
import 'package:ai_voice_generator/services/fakeyou_%20api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneratedLoadingPageView extends StatefulWidget {
  const GeneratedLoadingPageView({Key? key}) : super(key: key);

  @override
  State<GeneratedLoadingPageView> createState() =>
      _GeneratedLoadingPageViewState();
}

class _GeneratedLoadingPageViewState extends State<GeneratedLoadingPageView>
    with TickerProviderStateMixin {
  final generateGetIt = locator<GeneratedViewModel>();

  bool isBool = false;

  @override
  void initState() {
    getApiResponse();

    super.initState();
  }

  void getApiResponse() async {
    await Future.delayed(const Duration(milliseconds: 100));

    await FakeyouApiServices().sendTokenToApi(
      mytextFieldValue,
      generateGetIt.generatePersonList[myIndex].token,
    );

    setState(() {
      isBool = true;
    });

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const VoiceGeneratorPageView(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.h,
              child: Visibility(
                visible: !isBool,
                replacement: Container(),
                child: const CircularProgressIndicator(
                  strokeWidth: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.h),
              child: TextWidgets(
                  text: TextConstants.generateLoadingAppBarTitle, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
