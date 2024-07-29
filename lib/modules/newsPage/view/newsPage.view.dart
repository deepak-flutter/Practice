import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled/modules/newsCategory/view/newsCategory.view.dart';
import 'package:untitled/modules/newsHome/view/newsHome.view.dart';
import 'package:untitled/modules/newsPage/controller/newsPage.controller.dart';
import 'package:untitled/utils/assets.utils.dart';
import 'package:untitled/utils/routes.util.dart';

class NewsPageView extends StatelessWidget {
  NewsPageView({super.key, this.category = "general"});

  String category = "";
  final NewsPageController newsPageController = NewsPageController();

  @override
  Widget build(BuildContext context) {
    newsPageController.init(category);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Obx(
        () => PageView.builder(
            controller: newsPageController.pageController,
            scrollBehavior: const ScrollBehavior(),
            scrollDirection: Axis.vertical,
            onPageChanged: (value) => newsPageController.onPageChange(value),
            itemCount: newsPageController.newsList?.length,
            itemBuilder: (context, index) => index % 5 == 0 && newsPageController.isNativeAdLoaded.value && index != 0
                ? Center(
                  child: AdWidget(
                    ad: newsPageController.nativeAd,
                  ),
                )
                : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: CachedNetworkImage(
                                imageUrl: newsPageController
                                        .newsList?[index].urlToImage ??
                                    "https://st.depositphotos.com/1006899/2650/i/950/depositphotos_26505551-stock-photo-error-metaphor.jpg",
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AssetsUtils.getTiger(),
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                ),
                                fit: BoxFit.cover,
                                height: 200,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: const Offset(0, 0),
                                        spreadRadius: 1,
                                      )
                                    ]),
                                child: Text(
                                  newsPageController.newsList?[index].source !=
                                          null
                                      ? "${newsPageController.newsList?[index].source!.name}"
                                      : "Source",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${newsPageController.newsList?[index].title}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${newsPageController.newsList?[index].content?.split(" [+")[0]}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Published on: ${newsPageController.newsList?[index].publishedAt?.substring(0, 10)}",
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        const Flexible(
                            child: SizedBox(height: double.infinity)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              onPressed: () =>
                                  newsPageController.onLanguageClick(),
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.green,
                                ),
                                child: const Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            MaterialButton(
                              onPressed: () => newsPageController.speak(
                                  "${newsPageController.newsList?[index].title}. ${newsPageController.newsList?[index].content?.split(" [+")[0]}"),
                              height: 100,
                              minWidth: 0,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Obx(
                                () => CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.amberAccent,
                                  child: Icon(
                                    newsPageController.isPlaying.value
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () => newsPageController.onReadMoreClick(
                              newsPageController.newsList?[index].url),
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              image: DecorationImage(
                                image: AssetImage(AssetsUtils.getTiger()),
                                fit: BoxFit.fitWidth,
                                opacity: 0.25,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${newsPageController.newsList?[index].description}",
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Text(
                                  "Tap to know more",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
      bottomNavigationBar: Obx(
        () => newsPageController.isBannerAdLoaded.value
            ? SizedBox(
                height: newsPageController.bannerAd.size.height.toDouble(),
                width: newsPageController.bannerAd.size.width.toDouble(),
                child: AdWidget(ad: newsPageController.bannerAd),
              )
            : AnimatedContainer(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: newsPageController.isBottomBarVisible.value ? 60 : 0,
                duration: const Duration(milliseconds: 200),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => {RoutesUtil.to(() => NewsHomeView())},
                      icon: const Icon(Icons.home, size: 30, color: Colors.white),
                      key: newsPageController.keyBottomNavigation1,
                    ),
                    const Icon(Icons.search_rounded,
                        size: 30, color: Colors.white),
                    IconButton(
                      onPressed: () =>
                          {RoutesUtil.to(() => NewsCategoryView())},
                      icon: const Icon(
                        Icons.grid_view_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(Icons.bookmark_add,
                        size: 30, color: Colors.white),
                  ],
                ),
              ),
      ),
    );
  }
}
