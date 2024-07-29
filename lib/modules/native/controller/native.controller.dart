import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NativeController extends GetxController {
  static const batteryChannel = MethodChannel('battery');
  RxString batteryLevel = "Waiting...".obs;

  Future onClick() async {
    print("clicked");

    final arguments = {'name': 'Sarah Abs'};
    final int batteryLevel = await batteryChannel.invokeMethod('getBatteryLevel', arguments);
    this.batteryLevel.value = "$batteryLevel %";
  }
}