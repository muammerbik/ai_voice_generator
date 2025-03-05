import 'package:flutter/material.dart';

class Navigation {
  Navigation._();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey();

  // iOS'a özel geçiş
  static Future<T?>? push<T>({required Widget page}) =>
      navigationKey.currentState?.push(_iosPageRoute(page));

  static Future<T?>? pushNamed<T>({required String root, Object? arg}) =>
      navigationKey.currentState?.pushNamed(root, arguments: arg);

  static void ofPop() => navigationKey.currentState?.pop();

  static Future<T?>? pushAndRemoveAll<T>({required Widget page}) =>
      navigationKey.currentState
          ?.pushAndRemoveUntil(_iosPageRoute(page), (route) => false);

  static Future<T?>? pushReplace<T>({required Widget page}) =>
      navigationKey.currentState?.pushReplacement(_iosPageRoute(page));

  static Future<T?>? pushNamedAndRemoveAll<T>(
          {required String root, Object? arg}) =>
      navigationKey.currentState
          ?.pushNamedAndRemoveUntil(root, (route) => false, arguments: arg);

  static Future<T?>? pushReplacementNamed<T>({required String root}) =>
      navigationKey.currentState?.pushReplacementNamed(root);

  // iOS Geçişi için özelleştirilmiş sayfa rotası
  static PageRouteBuilder<T> _iosPageRoute<T>(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); 
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
