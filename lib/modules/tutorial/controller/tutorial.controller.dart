import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialController extends GetxController{
  GlobalKey globalKeyAppBar1 = GlobalKey();
  GlobalKey globalKey1 = GlobalKey();
  GlobalKey globalKey2 = GlobalKey();
  GlobalKey globalKey3 = GlobalKey();

  late TutorialCoachMark tutorialCoachMark;

  init(){
    createTutorial();
    Future.delayed(2.seconds, () {
      showTutorial();
    },);
  }

  showTutorial() {
    Logger().i("showTutorial");
    tutorialCoachMark.show(context: Get.context!);
  }

  createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: createTargets(),
      colorShadow: Colors.blue.withOpacity(0.7),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      // imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (p0) {
        print("onClickTarget: $p0");
      },
      onClickTargetWithTapPosition: (p0, p1) {
        print("onClickTargetWithTapPosition: $p0 $p1");
      },
      onClickOverlay: (p0) {
        print("onClickOverlay: $p0");
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> createTargets() {
    List<TargetFocus> targets = [];
    targets.add(TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: globalKeyAppBar1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Show app tour",
                      style: TextStyle(
                        color: context.theme.colorScheme.onPrimaryContainer,
                      ),
                    )
                  ],
                );
              })
        ]));

    return targets;
  }

}