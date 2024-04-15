import 'package:flutter/material.dart';
import 'package:untitled/utils/assets.utils.dart';

class PageDetailsComponent extends StatelessWidget {
  const PageDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text(
          "Detail",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Hero(
              tag: "tiger",
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  AssetsUtils.getTiger(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Today we present you with a new Flutter release, Flutter 3.19. This release brings a new Dart SDK for Gemini, a widget enabling developers to add fine-grained control to widget animations, a rendering boost with updates to Impeller, tooling to help implement deep links, Windows Arm64 support and so much more!The Flutter community continues to impress, merging 1429 pull requests by 168 community members, with 43 community members committing their first Flutter pull requests!Keep reading to learn about all the new additions and improvements the Flutter community has contributed to this latest release!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
