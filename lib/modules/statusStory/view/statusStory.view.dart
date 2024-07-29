import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';
import 'package:untitled/modules/statusStory/controller/statusStory.controller.dart';
import 'package:untitled/modules/statusStoryPage/view/statusStoryPage.view.dart';
import 'package:untitled/utils/routes.util.dart';

class StatusStoryView extends StatelessWidget {
  StatusStoryView({super.key});

  final StatusStoryController statusStoryController = StatusStoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () => RoutesUtil.to(()=>StatusStoryPageView()),
            child: StatusView(
              centerImageUrl: "https://assets.mspimages.in/gear/wp-content/uploads/2023/04/fUNNY-3.jpg",
              numberOfStatus: 4,
              indexOfSeenStatus: 2,
              padding: 5,
            ),
          ),
        ],
      ),
    );
  }
}
