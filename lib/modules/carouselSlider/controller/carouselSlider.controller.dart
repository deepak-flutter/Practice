import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CarouselSliderController extends GetxController{
  ScrollController listScrollController = ScrollController(initialScrollOffset: 1.1);

  RxInt selectedIndex = 0.obs;

  onChange(int index){
    selectedIndex.value = index;
  }
}