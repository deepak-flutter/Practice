import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:untitled/modules/hive/view/hive.view.dart';
import 'package:untitled/modules/newsPage/view/newsPage.view.dart';
import 'package:untitled/utils/routes.util.dart';

class NewsHomeController extends GetxController {
  CarouselController carouselController = CarouselController();

  List<String> hottestTopicsNameList = [
    "Election 2024",
    "Entertainment",
    "Electoral Bonds",
    "Supreme Court",
    "Sensex",
  ];

  List<String> hottestTopicsLinkList = [
    "https://img.freepik.com/free-vector/international-day-democracy_23-2148608691.jpg?t=st=1708603041~exp=1708606641~hmac=f5c14e669aaa81e8504fccac4eb939e9c2ef8edf7c768aa03951a6fccca49f1b&w=740",
    "https://img.freepik.com/free-vector/film-rolls-concept-illustration_114360-6404.jpg?t=st=1708603241~exp=1708606841~hmac=ec12edb708284e64300e74c94d87fc1c614e4721c6c5496f96a0c50c1621dfd9&w=740",
    "https://img.freepik.com/free-vector/indian-rupee-money-bag_23-2147988660.jpg?w=740&t=st=1708603331~exp=1708603931~hmac=a91c759944ddb5873797f1aef2e090e61e49b8f957dc8b47204982543c0d9e4b",
    "https://img.freepik.com/free-vector/law-isometric-composition-with-mallet-legal-code-book-bible-scale-justice-symbol_1284-29225.jpg?w=740&t=st=1708603445~exp=1708604045~hmac=634531ff318cb4bf3b6aa779724fbf7214f61be45c1a3f0daddcbd1b17aae49d",
    "https://img.freepik.com/free-vector/stock-market-concept-with-bull-bear_1017-9634.jpg?t=st=1708603472~exp=1708607072~hmac=85e8fd4ef347cf758c3335211d55fdedf2767dc0eca7a2674be9241dd93199fe&w=740",
  ];

  final GlobalKey globalKeyZero = GlobalKey();
  final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThree = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();
  final GlobalKey globalKeyFive = GlobalKey();

  RxInt activePage = 0.obs;

  onPageChanged(int index, CarouselPageChangedReason reason) {
    print("$index $reason");
    activePage.value = index;
  }

  onMenuClick(BuildContext context) {
    ShowCaseWidget.of(context).startShowCase([globalKeyZero, globalKeyOne, globalKeyTwo, globalKeyThree, globalKeyFour, globalKeyFive]);
  }

  onExploreClick(){
    RoutesUtil.to(()=>HiveView());
  }
}
