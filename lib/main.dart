import 'package:ai_voice_generator/components/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it/get_it.dart';
import 'package:ai_voice_generator/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setUpGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: TextConstants.appBarTitle,
          navigatorKey: Navigation.navigationKey,
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(backgroundColor: ColorConstants.black),
            scaffoldBackgroundColor: ColorConstants.black,
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorConstants.buttonPurpleColor,
            ),
            useMaterial3: true,
          ),
          home: const StarterPage(),
        );
      },
    );
  }
}
