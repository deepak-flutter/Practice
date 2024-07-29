import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:translator/translator.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:untitled/api/call.api.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import '../../../models/news.model.dart';

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

  // MobAd
  late BannerAd bannerAd;
  late NativeAd nativeAd;
  late InterstitialAd interstitialAd;
  RxBool isBannerAdLoaded = false.obs;
  RxBool isNativeAdLoaded = false.obs;
  RxBool isInterstitialAdLoaded = false.obs;
  var bannerAdUnitId =
      "ca-app-pub-3940256099942544/9214589741"; // testing ad id
  var nativeAdUnitIdList = [
    "ca-app-pub-3940256099942544/2247696110",
    "ca-app-pub-3940256099942544/2247696110"
  ]; // testing ad id
  var interstitialAdUnitId =
      "ca-app-pub-3940256099942544/1033173712"; // testing ad id
  int currentId = 0;

  init(String category) {
    this.category = category;
    initBannerAd();
    // hiveGet();
    // isConnected();
    print("init");
    createTutorial();
    Future.delayed(1.seconds, () {
      showTutorial();
    },);
  }

  NewsPageController() {
    pageController.addListener(() {
      if (pageController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isBottomBarVisible.value = false;
      } else {
        isBottomBarVisible.value = true;
      }
    });
    super.onInit();

    isConnected();
  }

  late TutorialCoachMark tutorialCoachMark;
  GlobalKey keyBottomNavigation1 = GlobalKey();

  showTutorial() {
    Logger().i("showTutorial");
    tutorialCoachMark.show(context: Get.context!);
  }

  createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: createTargets(),
      colorShadow: Get.context!.theme.colorScheme.surfaceTint,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (p0) {
        print("onClickTarget: $p0");
      },
      onClickTargetWithTapPosition: (p0, p1) {
        print("onClickTargetWithTapPosition: $p0 $p1");
      },
      onClickOverlay: (p0) {
        print("onClickOverlay: $p0");
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> createTargets() {
    List<TargetFocus> targets = [];
    targets.add(TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Show app tour",
                      style: TextStyle(
                        color: context.theme.colorScheme.onPrimaryContainer,
                      ),
                    )
                  ],
                );
              })
        ]));

    return targets;
  }

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerAdLoaded.value = true;
          print(ad);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Banner Ad Error: $ad $error");
        },
      ),
      request: const AdRequest(),
    );

    // nativeAd = NativeAd(
    //   adUnitId: nativeAdUnitIdList[0],
    //   listener: NativeAdListener(
    //     onAdLoaded: (ad) {
    //       isNativeAdLoaded.value = true;
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       isNativeAdLoaded.value = false;
    //       ad.dispose();
    //       print("Native Ad Error: $ad $error");
    //     },
    //   ),
    //   request: const AdManagerAdRequest(),
    //   nativeTemplateStyle: NativeTemplateStyle(
    //     templateType: TemplateType.medium,
    //     cornerRadius: 100,
    //     mainBackgroundColor: Colors.red
    //   ),
    //   nativeAdOptions: NativeAdOptions(
    //     adChoicesPlacement: AdChoicesPlacement.topRightCorner,
    //     mediaAspectRatio: MediaAspectRatio.portrait,
    //     requestCustomMuteThisAd: true,
    //     shouldRequestMultipleImages: true,
    //     shouldReturnUrlsForImageAssets: true,
    //     videoOptions: VideoOptions(
    //       clickToExpandRequested: false,
    //       customControlsRequested: false,
    //       startMuted: true,
    //     ),
    //   ),
    // );

    InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            isInterstitialAdLoaded.value = true;
          },
          onAdFailedToLoad: (error) {
            interstitialAd.dispose();
            print("Interstitial ad error: $error");
          },
        ));

    // bannerAd.load();
    // nativeAd.load();
  }

  initNativeAd(String id) {
    nativeAd = NativeAd(
      adUnitId: id,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          isNativeAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          isNativeAdLoaded.value = false;
          ad.dispose();
          print("Native Ad Error: $ad $error");
        },
      ),
      request: const AdManagerAdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium,
          cornerRadius: 100,
          mainBackgroundColor: Colors.red),
      nativeAdOptions: NativeAdOptions(
        adChoicesPlacement: AdChoicesPlacement.topRightCorner,
        mediaAspectRatio: MediaAspectRatio.portrait,
        requestCustomMuteThisAd: true,
        shouldRequestMultipleImages: true,
        shouldReturnUrlsForImageAssets: true,
        videoOptions: VideoOptions(
          clickToExpandRequested: false,
          customControlsRequested: false,
          startMuted: true,
        ),
      ),
    );

    nativeAd.load();
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
    } else {
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
    // stopSpeaking();
    // if (!isDataAvailable) return;
    if ((page == (totalPages.value - 6)) &&
        (categoryList.length != categoryIndex)) {
      pagination++;
    }
    if (page == (newsList!.length - 1)) {
      SnackbarHelper.error("End of page");
    }

    if (page % 5 == 0) {
      print("object");
      if (currentId == 0) {
        initNativeAd(nativeAdUnitIdList[0]);
        currentId = 1;
      } else if (currentId == 1) {
        initNativeAd(nativeAdUnitIdList[1]);
        currentId = 0;
      }
    }
  }

  onReadMoreClick(String? source) async {
    if (isInterstitialAdLoaded.value) {
      interstitialAd.show();
    }
    // RoutesUtil.to(() => InAppView(
    //     url: source ??
    //         "https://api.flutter.dev/flutter/widgets/PageView-class.html"));

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
    // print("Translating");
    // var translation = await translator.translate(text, to: "mr");
    // print(translation);

    print("Speaking");
    // await flutterTts.setVoice({"name": "mr-in-x-mrf-network", "locale": "mr-IN"});
    // await flutterTts.setLanguage(languageList[0]);
    // print(await flutterTts.getMaxSpeechInputLength);
    // print(await flutterTts.getEngines);
    // print(await flutterTts.getDefaultEngine);
    await flutterTts.setSilence(0);
    // await flutterTts.setSpeechRate(0.5);
    // await flutterTts.setPitch(1);
    await flutterTts.speak(text);
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
