import 'package:flutter/material.dart';
import 'package:untitled/modules/tutorial/controller/tutorial.controller.dart';

class TutorialView extends StatelessWidget {
  TutorialView({super.key});

  final TutorialController tutorialController = TutorialController();

  @override
  Widget build(BuildContext context) {
    tutorialController.init();
    return Scaffold(
      appBar: AppBar(
        key: tutorialController.globalKeyAppBar1,
        leading: const Icon(Icons.menu_rounded),
        title: const Text("Tutorial"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
            children: [
              Container(
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text("1"),
              ),
              const SizedBox(height: 100),
              Container(
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text("2"),
              ),
              const SizedBox(height: 100),
              Container(
                height: 100,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text("3"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
