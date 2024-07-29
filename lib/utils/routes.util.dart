import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutesUtil {
  static to(Widget Function() page) => Get.to(page, transition: Transition.rightToLeftWithFade);
  static off(Widget Function() page) => Get.off(page, transition: Transition.rightToLeftWithFade);
  static offAll(Widget Function() page) => Get.offAll(page, transition: Transition.rightToLeftWithFade);
}