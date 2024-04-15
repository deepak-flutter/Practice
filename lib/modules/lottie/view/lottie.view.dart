import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/lottie.controller.dart';

class LottieView extends StatelessWidget {
  LottieView({super.key});

  final LottieController playGameController = LottieController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.onPrimaryContainer,
        title: Text(
          "Play Game".tr,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.theme.colorScheme.primaryContainer),
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        // itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: Lottie.asset(
                  playGameController.playGameLottieList[index % playGameController.playGameLottieList.length],
                  reverse: false,
                  fit: BoxFit.contain,
                  height: 300,
                  width: 250,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                playGameController.playGameTextList[index % playGameController.playGameTextList.length],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onPrimaryContainer,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
