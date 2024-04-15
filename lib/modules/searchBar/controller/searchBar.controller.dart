import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController{
  TextEditingController searchFieldController = TextEditingController();

  List<String> examsList = [
    "SSC",
    "SSC GD",
    "UPSC",
    "PCS",
    "WBPCS",
  ];

  onSuggestionsCallBack(String search){
    if (search.isNotEmpty) {
      return examsList
          .where((exam) =>
          exam.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    else{
      return [];
    }
  }

  onSelected(String value){
    searchFieldController.text = value;
    print(searchFieldController.text);
  }
}