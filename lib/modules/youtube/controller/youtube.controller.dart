import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;

  init(String videoId){
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'K1uH_SN4X0w',
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
  }

}
