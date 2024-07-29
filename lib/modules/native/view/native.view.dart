import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/native/controller/native.controller.dart';

class NativeView extends StatelessWidget {
  NativeView({super.key});

  final NativeController nativeController = NativeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        // backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.battery_6_bar_rounded,
              size: 45,
              color: Colors.white,
            ),
            Obx(
              () => Text(
                "Battery Level: ${nativeController.batteryLevel}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () => nativeController.onClick(),
              child: Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.red,
                ),
                child: const Text(
                  "Click",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
