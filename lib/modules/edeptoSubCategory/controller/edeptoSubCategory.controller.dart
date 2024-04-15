import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import 'package:untitled/models/subCategory.model.dart';
import 'package:untitled/modules/edeptoSubCategory/components/languageBottomModalSheet.component.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../../helpers/loadingPage.helper.dart';

class EdeptoSubCategoryController extends GetxController {
  Logger logger = Logger();
  late String subCategoryId;
  int subCategoryPage = 1;
  RxList<SubCategoryData> subCategoryList = <SubCategoryData>[].obs;
  RxBool isLoading = false.obs;
  bool isDataAvailable = true;

  ScrollController scrollController = ScrollController();

  init(String id) {
    subCategoryId = id;
    Future.delayed(const Duration(milliseconds: 200), () => subCategoryApiCall());
    scrollController.addListener(() => onScroll());
  }

  subCategoryApiCall() async {
    isLoading.value = true;
    var res = await ApiCall.get("${UrlApi.getSubCategory}$subCategoryId/$subCategoryPage/10");
    isLoading.value = false;
    subCategoryPage++;
    LoadingPage.close();
    
    SubCategoryModel subCategoryRes = SubCategoryModel.fromJson(res);
    
    if(subCategoryRes.responseCode == 200){
      subCategoryList.addAll(subCategoryRes.data!);
      print(subCategoryList[0].languages?[0].language);
    }
    else{
      isDataAvailable = false;
    }
  }

  onMoreLanguageClick(List<Languages> languageList) {
    print("All Languages");
    LanguageBottomModalSheetComponent.showModalSheet(context: Get.context!, languageList: languageList);
  }

  onCardClick() {
    print("Clicked on Card");
  }

  String getLanguage(List<Languages> languageList){
    String languageString = "";
    for(int i=0; i<languageList.length; i++){
      if(i==0){
        languageString += languageList[i].language!;
      }
      else if(i==1){
        languageString += ", ${languageList[i].language}";
      }
    }
    return languageString;
  }

  onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if(isDataAvailable){
        subCategoryApiCall();
      }
    }
  }
}
