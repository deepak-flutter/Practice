import 'dart:io';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class ShareController extends GetxController {
  Logger logger = Logger();
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  onShareClick(String title) async{
    print("Share");
    const urlImage = "https://img.freepik.com/free-vector/computer-games-development-abstract-concept-illustration_335657-3692.jpg?w=740&t=st=1712642550~exp=1712643150~hmac=83b0937723197771fa3e0791c45c760c0ff7523a597cec18744e5a85b9554e40";

    FlutterShareMe flutterShareMe = FlutterShareMe();

    final url = Uri.parse(urlImage);
    final res = await http.get(url);
    final bytes = res.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = "${temp.path}/image.png";
    final file = await File(path).writeAsBytes(bytes);
    logger.i(file.path);

    await flutterShareMe.shareToWhatsApp(msg: "dlsjldj", imagePath: file.path, fileType: FileType.image);

    // XFile xfile = XFile(file.path);
    // await Share.shareXFiles([xfile], text: "tljlkjslksj",);


    // final url = Uri.parse(urlImage);
    // final res = await http.get(url);
    // final bytes = res.bodyBytes;
    //
    // final temp = await getTemporaryDirectory();
    // final path = "${temp.path}/image.png";
    // final file = await File([],path).writeAsBytes(bytes);
    // // XFile xfile = XFile("C:/Users/user/StudioProjects/untitled/assets/images/logo.png");
    // XFile xfile = XFile(file.path);
    // await Share.shareXFiles([xfile], text: "tljlkjslksj",);


  }

  onWhatsappShareClick() async {
    const urlImage = "https://dl-asset.cyberlink.com/web/prog/learning-center/html/15017/PDR19-YouTube-656_Interior_AI_App/img/ai_image_generator_01.webp";
    final url = Uri.parse(urlImage);
    final res = await http.get(url);
    final bytes = res.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = "${temp.path}/image.jpg";

    String response = await appinioSocialShare.shareToWhatsapp(
      "Message",
      filePaths: [path],
    );

    print(response);
  }
}
