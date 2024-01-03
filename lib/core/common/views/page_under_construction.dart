import 'package:translation_bt/core/common/widgets/gradient_background.dart';
import 'package:translation_bt/core/res/medias.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: Center(child: Lottie.asset(MediaRes.pageUnderConstruction)),
      ),
    );
  }
}
