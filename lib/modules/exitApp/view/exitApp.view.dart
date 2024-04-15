import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/exitApp/controller/exitApp.controller.dart';

class ExitAppView extends StatelessWidget {
  ExitAppView({super.key});

  final ExitAppController exitAppController = ExitAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.primaryContainer,
        title: Text(
          "Exit".tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: context.theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => exitAppController.onExitButtonClick(context),
            icon: Icon(
              Icons.exit_to_app_rounded,
              size: 40,
              color: context.theme.colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Exit".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
