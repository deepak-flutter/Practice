import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
    print(mobileController.text);
  }
}