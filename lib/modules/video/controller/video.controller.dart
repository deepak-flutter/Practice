import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  PageController pageController = PageController();

  List<String> urlList = [
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189702/videos/vrplr9qaskm5xk2mrluq.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709190149/videos/aau1o4bajrwamitphpvm.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709190149/videos/m6f8qbwv5dd7nrtembfn.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709190149/videos/olj73jkkqvb3bo2hhzbs.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709190149/videos/dpibhmnduwdwhasivvty.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709190149/videos/jjmcq4zlwwdnkpu4na8w.mp4",
    "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4",
    "https://assets.downlink.in/videos/20240312075502_a-retro-1980s-style-error-blinking-computer-screen-loopable_ekyovotn__1535fa129b9ede4e7a2a87def74f90cb__P360.mp4"
  ];

  String source = "https://assets.downlink.in/videos/20240312075502_a-retro-1980s-style-error-blinking-computer-screen-loopable_ekyovotn__1535fa129b9ede4e7a2a87def74f90cb__P360.mp4";
  // String source = "https://res.cloudinary.com/def9h4fvl/video/upload/v1709189862/videos/huwde2ipp3tjoolneb7y.mp4";


  ChewieController getChewieController(String source) {
    chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(source)),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      showControlsOnInitialize: false,
      allowFullScreen: false,
    );
    return chewieController;
  }

  onPageChange(int index) async {
    print("Page change $index");

    source = urlList[index];
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(urlList[index]),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
    );
    await videoPlayerController.initialize();
    // videoPlayerController.setLooping(true);
    // videoPlayerController.play();
  }
}
