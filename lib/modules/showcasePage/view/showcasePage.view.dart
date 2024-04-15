import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:untitled/modules/showcasePage/controller/showcasePage.controller.dart';

class ShowcasePageView extends StatelessWidget {
  ShowcasePageView({super.key});

  ShowcasePageController showcasePageController = ShowcasePageController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),
        () => showcasePageController.onWantTourClicked(context));
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.black,
            leading: Showcase(
              key: showcasePageController.keyOne,
              title: "Menu",
              description: "Show all menu",
              child: const Icon(Icons.menu_rounded, color: Colors.white),
            ),
          ),
          body: ListView(
            children: [
              Showcase(
                key: showcasePageController.keyTwo,
                title: "Title",
                description: 'Description',
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 100,
                ),
              ),
              const SizedBox(height: 20),
              Showcase(
                key: showcasePageController.keyThree,
                title: "Button",
                description: "Click to perform action",
                child: MaterialButton(
                  onPressed: () =>
                      showcasePageController.onWantTourClicked(context),
                  color: Colors.blue,
                  height: 50,
                  minWidth: 0,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text("Click"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
