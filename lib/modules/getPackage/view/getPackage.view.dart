import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/getPackage/controller/getPackage.controller.dart';

class GetPackageView extends StatelessWidget {
  GetPackageView({super.key});

  final GetPackageController getPackageController = GetPackageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 65),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ).fadeIn(isSequential: true).bounce(begin: -0.8, end: 0.5),
          const FlutterLogo().spin(isSequential: false),
          MaterialButton(
            onPressed: () => getPackageController.onBtnClick(),
            color: Colors.red,
            child: Text("Click"),
          ),
          const Text(
            "",
            strutStyle: StrutStyle(),
          ),
        ],
      ),
    );
  }
}
