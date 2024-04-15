import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/translation/controller/translation.controller.dart';

class TranslationView extends StatelessWidget {
  TranslationView({super.key});

  final TranslationController translationController = TranslationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Text(
          "Translation".tr,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Hello ${translationController.name}".tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
