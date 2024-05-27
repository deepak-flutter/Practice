import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:translator/translator.dart';
import 'package:untitled/api/call.api.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import 'package:untitled/utils/routes.util.dart';
import '../../../models/news.model.dart';
import '../../inApp/view/inApp.view.dart';

class NewsPageController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  RxBool isBottomBarVisible = true.obs;
  RxList? newsList = [].obs;
  RxInt totalPages = 0.obs;
  List<String> categoryList = [
    "general",
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology"
  ];
  int categoryIndex = 0;
  int pagination = 1;
  String category = "general";
  RxBool isPlaying = false.obs;
  RxString language = "en".obs;
  List<String> languageList = [
    "en-IN",
    "hi-IN",
    "mr-IN",
    "gu-IN",
    "kn-IN",
    "bn-IN",
    "pa-IN",
    "ml-IN",
    "ta-IN",
    "te-IN"
  ];
  List<String> languageNameList = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Kannada",
    "Bengali",
    "Punjabi",
    "Malayalam",
    "Tamil",
    "Telugu"
  ];

  PageController pageController = PageController();

  init(String category) {
    this.category = category;
    // hiveGet();
    // isConnected();
  }

  NewsPageController() {
    pageController.addListener(() {
      if (pageController.position.userScrollDirection == ScrollDirection.reverse) {
        isBottomBarVisible.value = false;
      } else {
        isBottomBarVisible.value = true;
      }
    });
    super.onInit();

    isConnected();
  }

  void isConnected({int page = 0}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);

    if (connectivityResult != ConnectivityResult.none) {
      // hivePut();
      apiCall(category: category, page: pagination);
      // if (page == 0 || ((newsList!.length - 5) == (page + 1))) {
      //   if (page == 0) {
      //     newsList?.value = [];
      //     totalPages.value = 0;
      //   }
      //   apiCall(category: category, page: pagination);
      // }
    }
    else {
      // if (newsList!.isEmpty) {
      //   hiveGet();
      // }
    }
  }

  apiCall({String category = "general", page}) async {
    var res = await ApiCall.get("https://newsapi.org/v2/top-headlines?country=in&category=$category&page=$page&apiKey=26ef454f72424685bb87ab491ee9c446");

    NewsModel newsRes = NewsModel.fromJson(res);

    if (newsRes.status == "ok") {
      print("Api data length: ${newsRes.articles?.length}");
      // hivePut(newsRes.articles ?? []);
      
      if (newsRes.articles!.isNotEmpty) {
        hivePut(newsRes.articles!);
        hiveGet();

        print("Api response- totalResults: ${newsRes.totalResults}  $category");
      }
    }
  }

  onPageChange(int page) {
    print("${page + 1} ${newsList?.length}");
    isConnected(page: page);
    stopSpeaking();
    // if (!isDataAvailable) return;
    if ((page == (totalPages.value - 6)) &&
        (categoryList.length != categoryIndex)) {
      pagination++;
    }
    if (page == (newsList!.length - 1)) {
      SnackbarHelper.error("End of page");
    }
  }

  onReadMoreClick(String? source) async {
    RoutesUtil.to(() => InAppView(url: source ?? "https://api.flutter.dev/flutter/widgets/PageView-class.html"));

    // var url = Uri.parse("https://api.flutter.dev/flutter/widgets/PageView-class.html" ?? "");
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // }
  }

  hivePut(List<Articles> articles) async {
    var box = await Hive.openBox("user");

    box.put("newsData", articles);
    // box.add(articles);
    print("Hive : ${box.get("newsData").length}");

    // await box.close();
  }

  hiveGet() async {
    var box = await Hive.openBox("user");
    var res = box.get("newsData");
    print(res.sublist(10, 20));


    if (res == null) {
      SnackbarHelper.error("No Data Found");
    } else {
      newsList?.addAll(res);
      totalPages.value = newsList!.length;
      print("Total pages: ${totalPages.value}");
      print("Hive get: Data available");
    }

    // await box.close();
  }

  Future<void> speak(String text) async {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value == false) {
      await flutterTts.pause();
      return;
    }
    print("Translating");
    var translation = await translator.translate(text, to: "mr");
    print(translation);

    print("Speaking");
    await flutterTts.setVoice({"name": "mr-in-x-mrf-network", "locale": "mr-IN"});
    await flutterTts.setLanguage(languageList[2]);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(translation.toString());
    flutterTts.setCompletionHandler(() => stopSpeaking());
  }

  stopSpeaking() async {
    isPlaying.value = false;
    await flutterTts.stop();
  }

  onLanguageClick() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return BottomSheet(
          onClosing: () {
            Get.back();
          },
          builder: (context) {
            return Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Wrap(
                children: [
                  MaterialButton(
                    onPressed: () {
                      language.value = languageList[0];
                    },
                    minWidth: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 0,
                    child: const Text(
                      "English",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
