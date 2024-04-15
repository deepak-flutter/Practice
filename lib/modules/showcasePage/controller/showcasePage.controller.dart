import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowcasePageController extends GetxController {
  GlobalKey keyOne = GlobalKey();
  GlobalKey keyTwo = GlobalKey();
  GlobalKey keyThree = GlobalKey();

  RxBool isShowcaseNeeded = false.obs;

  init() {
    Future.delayed(
      const Duration(seconds: 1),
      () => {isShowcaseNeeded.value = true},
    );
  }

  onWantTourClicked(BuildContext context) {
    ShowCaseWidget.of(context).startShowCase([keyOne, keyTwo, keyThree]);
  }

  onDontWantTourClicked() {
    isShowcaseNeeded.value = false;
  }
}
