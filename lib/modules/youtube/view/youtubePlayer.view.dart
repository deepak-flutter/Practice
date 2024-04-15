import 'package:flutter/material.dart';
import 'package:untitled/utils/assets.utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controller/youtube.controller.dart';

class YoutubeView extends StatelessWidget {
  YoutubeView({super.key});

  YoutubeController youtubeController = YoutubeController();

  @override
  Widget build(BuildContext context) {
    youtubeController.init("K1uH_SN4X0w");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Player"),
        toolbarHeight: 60,
        backgroundColor: Colors.blue.shade200,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: YoutubePlayer(
                controller: youtubeController.youtubePlayerController,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
