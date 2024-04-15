
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverController extends GetxController with GetSingleTickerProviderStateMixin{
  TabController? tabController;

  @override
  void onInit() {
    print("object");
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(() {
      print(tabController?.index);
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.removeListener(() { });
    super.dispose();
  }

}