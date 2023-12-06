import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
import 'package:ai_voice_generator/global.dart';
import 'package:ai_voice_generator/pages/generate/viewmodel/generated_viewmodel.dart';
import 'package:ai_voice_generator/pages/share_page/view/share_page_view.dart';
import 'package:ai_voice_generator/services/fakeyou_%20api_services.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';

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
      builder: (context) => const SharePageView(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Positioned(
          right: 70,
          child: Center(
            child: TextUntil.buildTextWidget(
              TextConstants.generateLoadingAppbarTitle,
              22,
              Colors.white,
              TextConstants.poppins,
              FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Visibility(
            visible: !isBool,
            child: const CircularProgressIndicator(
              strokeWidth: 15,
            ),
            replacement: Container(),
          ),
        ),
      ),
    );
  }
}
