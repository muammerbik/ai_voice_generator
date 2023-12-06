import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/get_it.dart';
import 'package:ai_voice_generator/pages/splash_screen/view/splash_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextConstants.appBarTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: ColorConstants.black),
        scaffoldBackgroundColor: ColorConstants.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConstants.buttonPurpleColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreenView(),
    );
  }
}
