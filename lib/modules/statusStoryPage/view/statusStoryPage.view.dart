import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:untitled/modules/statusStoryPage/controller/statusStoryPage.controller.dart';

class StatusStoryPageView extends StatelessWidget {
  StatusStoryPageView({super.key});

  final StatusStoryPageController statusStoryPageController =
      StatusStoryPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: statusStoryPageController.storyController,
        indicatorHeight: IndicatorHeight.large,
        onComplete: () => Get.back(),
        storyItems: [
          StoryItem.pageVideo(
            "https://news-flick.downlink.in/newsflick-poll-videos/fc3786a8-13ba-4eb3-a51d-8b9910dae6f4.webm",
            controller: statusStoryPageController.storyController,
          ),
          StoryItem.pageImage(
            url:
                "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
            controller: statusStoryPageController.storyController,
            imageFit: BoxFit.fitWidth,
          ),
          StoryItem.pageImage(
            url:
                "https://assets.mspimages.in/gear/wp-content/uploads/2023/04/fUNNY-3.jpg",
            controller: statusStoryPageController.storyController,
            imageFit: BoxFit.fitWidth,
          ),
          StoryItem.pageImage(
            url: "https://cdn-lfs-us-1.huggingface.co/repos/ac/b3/acb3de135033956271456e8ab1bbe284964f74bf9fab49fb27002b798f18f382/0450e96b0141236216854cda9303da17e2096d48cc144bb12dbff4111d6f5ab2?response-content-disposition=inline%3B+filename*%3DUTF-8%27%27image-classification-input.jpeg%3B+filename%3D%22image-classification-input.jpeg%22%3B&response-content-type=image%2Fjpeg&Expires=1722514837&Policy=eyJTdGF0ZW1lbnQiOlt7IkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTcyMjUxNDgzN319LCJSZXNvdXJjZSI6Imh0dHBzOi8vY2RuLWxmcy11cy0xLmh1Z2dpbmdmYWNlLmNvL3JlcG9zL2FjL2IzL2FjYjNkZTEzNTAzMzk1NjI3MTQ1NmU4YWIxYmJlMjg0OTY0Zjc0YmY5ZmFiNDlmYjI3MDAyYjc5OGYxOGYzODIvMDQ1MGU5NmIwMTQxMjM2MjE2ODU0Y2RhOTMwM2RhMTdlMjA5NmQ0OGNjMTQ0YmIxMmRiZmY0MTExZDZmNWFiMj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSomcmVzcG9uc2UtY29udGVudC10eXBlPSoifV19&Signature=acj5xoDZF50syIf-v4xyhCp3RHG1wdL%7EeYboB9F-m-Tq6IETj0Yj1SzUjH8QzN63UMCkx52ftv5LNOaP%7Ex7niKglY83sllNwkhT4wQKEq8qIdgLg9fppIgTrv5rhQzRX2vQsqrWbgcNIlt6e-8K2U6-jPTxCIB2wYAPROWCS9pjNUr9D1DHCbyxKlYBIA2vzU5-4U7nnhgf7UxX5Qm9YBljJAneYEKq8i5qjvye1XhY5Uyv1UgTurH0u-iIQRYgE4NiHYDDtKzEgBh0jrULsZE0AymlBovtCUAmR1Lj0H%7E1mk6f1o%7EdC%7ES2Pqnbj0kf0pOLV5J2QJAYH%7EueB9bvpIA__&Key-Pair-Id=K24J24Z295AEI9",
            controller: statusStoryPageController.storyController,
            imageFit: BoxFit.fitWidth,
          ),
          StoryItem.pageVideo(
            "https://assets.downlink.in/unibit_video/20240615100859_unibit11-installation-video.mp4",
            controller: statusStoryPageController.storyController,
            duration: 32.seconds,
            imageFit: BoxFit.fitWidth,
            caption: const Text(
              "lsjdkls",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          StoryItem.text(title: "title", backgroundColor: Colors.orange,),
        ],
      ),
    );
  }
}
