import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/switch/controller/switch.controller.dart';
import 'package:untitled/utils/assets.utils.dart';

class SwitchView extends StatelessWidget {
  SwitchView({super.key});

  final SwitchController switchController = SwitchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 65,
        centerTitle: true,
        title: Text(
          "Switch".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Switch(
                value: switchController.switchStatus.value,
                onChanged: (value) => switchController.onSwitchChange(value),
                activeThumbImage: AssetImage(AssetsUtils.getLogo()),
              ),
            ),
            Obx(
              () => AnimatedToggleSwitch.dual(
                current: switchController.switchStatus.value,
                first: false,
                second: true,
                height: 40,
                spacing: 20,
                style: ToggleStyle(
                  indicatorColor: Colors.white,
                  backgroundColor: switchController.switchStatus.value ? Colors.blue : Colors.grey.shade400,
                ),
                indicatorSize: const Size.fromWidth(35),
                textMargin: const EdgeInsets.all(0),
                onChanged: (value) => switchController.onSwitchChange(value),
                iconBuilder: (value) => value
                  ? Image.asset(AssetsUtils.getLogo(), height: 25,)
                    : Image.asset(AssetsUtils.getLogo(), height: 25,),
                textBuilder: (value) => value
                ? const Text("Mega", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),)
                    : const Text("Mega", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
