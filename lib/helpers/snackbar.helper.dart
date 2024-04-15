import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void error(String? message) {
    Get.snackbar(
      "Error",
      message ?? "Error occured",
      colorText: Colors.white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void success(String? message) {
    Get.snackbar("Success", message ?? "Successful",
    colorText: Colors.white,
    backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
