import 'package:ai_voice_generator/companents/navigation_helper/navigation_helper.dart';
import 'package:ai_voice_generator/pages/home/view/home_page_view.dart';
import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumGridViewWidget extends StatefulWidget {
  const PremiumGridViewWidget({super.key});

  @override
  State<PremiumGridViewWidget> createState() => _PremiumGridViewWidgetState();
}

class _PremiumGridViewWidgetState extends State<PremiumGridViewWidget> {
  final premiumViewModel = PremiumViewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GridView.builder(
          itemCount: premiumViewModel.imageModel.length,
          itemBuilder: (context, index) {
            return Image.asset(
              premiumViewModel.imageModel[index],
              fit: BoxFit.contain,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          shrinkWrap: true,
        ),
        Positioned(
          right: 12.w,
          top: 36.h,
          child: IconButton(
            onPressed: () {
              Navigation.push(
                page: const HomePageView(),
              );
            },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                ),
                Image.asset(
                  "assets/images/sharp.png",
                  width: 24.h,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
