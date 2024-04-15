import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../controller/video.controller.dart';

class VideoView extends StatelessWidget {
  VideoView({super.key});

  final VideoController videoController = VideoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text("Video Player"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: videoController.urlList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => CardComponent(
          getChewieController: videoController.getChewieController,
          url: videoController.urlList[index],
        ),
      ),
    );
  }
}

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
    required this.getChewieController,
    required this.url,
  });

  final Function getChewieController;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 175,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Chewie(
                controller: getChewieController(url),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "ksjdklu jdklosjd fksjdfkljs kl",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// PageView.builder(
// controller: videoController.pageController,
// onPageChanged: (value) => videoController.onPageChange(value),
// scrollDirection: Axis.vertical,
// itemCount: videoController.urlList.length,
// itemBuilder: (context, index) => VideoPlayer(videoController.videoPlayerController),
// )
