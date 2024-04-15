import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/api/url.api.dart';
import 'package:untitled/models/category.model.dart';
import 'package:untitled/modules/edeptoMegaPass/view/edeptoMegaPass.view.dart';
import 'package:untitled/modules/edeptoSubCategory/view/edeptoSubCategory.view.dart';
import 'package:untitled/utils/routes.util.dart';

import '../../../api/call.api.dart';

class EdeptoHomeController extends GetxController {
  ScrollController scrollController = ScrollController();

  Logger logger = Logger();
  RxList<CategoryData> categoryList = <CategoryData>[].obs;
  RxBool isLoading = false.obs;

  int page = 1;
  bool isDataAvailable = true;

  EdeptoHomeController() {
    Future.delayed(const Duration(milliseconds: 200), () => categoryApiCall());
    scrollController.addListener(() => onScroll());
  }

  categoryApiCall() async {
    isLoading.value = true;
    var res = await ApiCall.get("${UrlApi.getAllCategory}$page/10");
    logger.i(res);
    page++;
    print("Page $page");
    isLoading.value = false;

    CategoryModel categoryRes = CategoryModel.fromJson(res);
    if (categoryRes.responseCode == 200) {
      if (categoryRes.data != null) {
        categoryList.addAll(categoryRes.data!);
      }
    }
    else{
      isDataAvailable = false;
    }
  }

  onViewAllClick(){
    print("View All");
    RoutesUtil.to(()=>EdeptoMegaPassView(onBuyNowClick: onBuyNowClick, onExamDetailsClick: onExamDetailsClick));
  }

  onBuyNowClick() async {
    print("Buy Now Clicked");
  }

  onExamDetailsClick() {
    print("Exam Details");
  }

  onCategoryCardClick(String id) async{
    print("Category Card Click $id");
    if(id.isNotEmpty){
      RoutesUtil.to(()=>EdeptoSubCategoryView(subCategoryId: id,));
    }
  }

  onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if(isDataAvailable){
        Future.delayed(const Duration(milliseconds: 200), () => categoryApiCall());
      }
    }
  }
}
