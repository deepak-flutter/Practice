import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:untitled/utils/assets.utils.dart';

class RiveView extends StatelessWidget {
  const RiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(toolbarHeight: 60, backgroundColor: Colors.lightBlueAccent),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: RiveAnimation.asset(AssetsUtils.getRiveAnimation()),
            ),
          ],
        ),
      ),
    );
  }
}
