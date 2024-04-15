import 'package:get/get.dart';
import 'package:untitled/utils/assets.utils.dart';

class LottieController extends GetxController {
  List playGameTextList = [
    "Hi, Player",
    "Play Game",
    "Sparkle",
    "Dog on Rocket",
    "Make Call"
  ];
  List playGameLottieList = [
    AssetsUtils.getRobotHiLottie(),
    AssetsUtils.getPlayGameLottie(),
    AssetsUtils.getSparkleLottie(),
    AssetsUtils.getDogOnRocketLottie(),
    AssetsUtils.getPhoneLottie(),
  ];
}
