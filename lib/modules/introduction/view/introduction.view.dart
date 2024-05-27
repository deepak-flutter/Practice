import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/introduction/controller/introduction.controller.dart';

class IntroductionView extends StatelessWidget {
  IntroductionView({super.key});

  final IntroductionController introductionController = IntroductionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        slides: introductionController.pages,
        indicatorType: IndicatorType.circle,
        onDone: (){
          print("done");
        },
        isFullScreen: true,
        footerPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
    );
  }
}
