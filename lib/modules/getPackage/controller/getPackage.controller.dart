import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

class GetPackageController extends GetxController {
  InAppReview inAppReview = InAppReview.instance;

  onBtnClick() async{
    print("object ${await inAppReview.isAvailable()}");
    // print(await inAppReview.isAvailable());
    if(await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }

    // await inAppReview.openStoreListing(
    //   appStoreId: "com.news.flick.app",
    // );
    // Get.close();
  }

}