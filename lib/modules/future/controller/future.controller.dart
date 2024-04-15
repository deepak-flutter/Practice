import 'package:get/get.dart';
import 'package:untitled/utils/assets.utils.dart';

class FutureController extends GetxController{
  Future<String> getData() async{
    String imgUrl = AssetsUtils.getHomeLogo();
    await Future.delayed(Duration(seconds: 1));

    return imgUrl;
  }
}