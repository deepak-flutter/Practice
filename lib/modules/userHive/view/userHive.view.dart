import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/userHive/controller/userHive.controller.dart';

class UserHiveView extends StatelessWidget {
  UserHiveView({super.key});

  final UserHiveController userHiveController = UserHiveController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
          ()=> Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${userHiveController.name.value}"),
              Text("Age: ${userHiveController.age.value}"),
              Text("Id: ${userHiveController.id.value}"),
            ],
                    ),
          ),
      ),
    );
  }
}
