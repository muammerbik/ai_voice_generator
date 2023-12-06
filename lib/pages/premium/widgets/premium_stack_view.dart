import 'package:ai_voice_generator/pages/home_page/view/home_page_view.dart';

import 'package:ai_voice_generator/pages/premium/viewmodel/premium_view_model.dart';
import 'package:flutter/material.dart';

class PremiumStackView extends StatefulWidget {
  const PremiumStackView({super.key});

  @override
  State<PremiumStackView> createState() => _PremiumStackViewState();
}

class _PremiumStackViewState extends State<PremiumStackView> {
  final premiumViewmodel = PremiumViewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GridView.builder(
          itemCount: premiumViewmodel.imageModel.length,
          itemBuilder: (context, index) {
            return Image.asset(premiumViewmodel.imageModel[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          shrinkWrap: true,
        ),
        Positioned(
          right: 13,
          top: 100,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePageView(),
              ));
            },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(35)),
                ),
                Image.asset(
                  "assets/images/sharp.png",
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
