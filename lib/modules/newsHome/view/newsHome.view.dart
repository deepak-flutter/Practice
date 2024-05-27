import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:showcase_tutorial/showcase_tutorial.dart';
import 'package:untitled/utils/assets.utils.dart';
import '../controller/newsHome.controller.dart';

class NewsHomeView extends StatelessWidget {
  NewsHomeView({super.key});

  final NewsHomeController newsHomeController = NewsHomeController();

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      enableAutoScroll: true,
      autoPlay: true,
      builder: Builder(
        builder: (context) => Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                color: Colors.deepPurple,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Showcase(
                            key: newsHomeController.globalKeyZero,
                            title: "Menu",
                            description: "Stay up-to-date on the latest news from around the world. Customize your feed to see the stories that matter most to you.",
                            child: IconButton(
                              onPressed: () =>
                                  newsHomeController.onMenuClick(context),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(Icons.menu_rounded,
                                  color: Colors.white),
                            ),
                          ),
                          Showcase(
                            key: newsHomeController.globalKeyOne,
                            title: "Discover",
                            description: "Stay up-to-date on the latest news from around the world. Customize your feed to see the stories that matter most to you.",
                            onTargetClick: () {
                              print("clicked");
                            },
                            disposeOnTap: false,
                            child: IconButton(
                              onPressed: () => newsHomeController.onExploreClick(),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(
                                Icons.explore_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Showcase(
                        key: newsHomeController.globalKeyThree,
                        title: "Search",
                        description: "Search news here.",
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gapPadding: 0,
                              borderSide: BorderSide(width: 0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gapPadding: 0,
                              borderSide: BorderSide(width: 0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gapPadding: 0,
                              borderSide: BorderSide(width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                              size: 30,
                            ),
                            hintText: "Search News",
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Showcase(
                      key: newsHomeController.globalKeyTwo,
                      title: "Top News",
                      description:
                          "Stay up-to-date on the latest news from around the world. Customize your feed to see the stories that matter most to you.",
                      child: const Text(
                        "Top News",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CarouselSlider(
                          carouselController: newsHomeController.carouselController,
                          options: CarouselOptions(
                            height: 225,
                            viewportFraction: 0.4,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            reverse: false,
                            animateToClosest: true,
                            onPageChanged: (index, reason) =>
                                newsHomeController.onPageChanged(index, reason),
                          ),
                          items: [0, 1, 2, 3, 4, 5].map((e) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Obx(
                                  () => MaterialButton(
                                    onPressed: () {
                                      print("$e");
                                    },
                                    minWidth: 0,
                                    padding: EdgeInsets.zero,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundColor:
                                              newsHomeController.activePage.value ==
                                                      e
                                                  ? Colors.deepOrange
                                                  : Colors.white70,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(100)),
                                            child: Lottie.asset(
                                              AssetsUtils.getFoodLottie(),
                                              reverse: false,
                                              fit: BoxFit.contain,
                                              height: 300,
                                              width: 250,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Interim Budget 2024",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: newsHomeController
                                                        .activePage.value ==
                                                    e
                                                ? 16
                                                : 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Showcase(
                            key: newsHomeController.globalKeyFour,
                            title: "Latest News",
                            description: "Get all the latest news here.",
                            child: const Text(
                              "Latest News",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              "https://img.freepik.com/free-vector/flat-design-bankruptcy-illustration-concept_23-2148491627.jpg?t=st=1708601291~exp=1708604891~hmac=ec41647475608098c63fe9bde8042d28e2cba8d68b479403c390585d58270b0b&w=740",
                              height: 150,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Lorem Airlines goes up by 32% YoY in FY23-24",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: const TextSpan(
                                text:
                                    "News app cartoon smartphone interface templates vector image News app cartoon smartphone interface templates vector image News app cartoon smartphone interface templates vector image ...",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black38,
                                ),
                                children: [
                                  TextSpan(
                                      text: " Read more",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.deepOrange,
                                      ))
                                ]),
                          ),
                          const SizedBox(height: 20),
                          Showcase(
                            key: newsHomeController.globalKeyFive,
                            title: "Hottest Topic",
                            description:
                                "The subject that generates the most discussion, receives the highest number of online searches",
                            child: const Text(
                              "Hottest Topic",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 130,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20)),
                                    child: Image.network(
                                      newsHomeController
                                          .hottestTopicsLinkList[index],
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    newsHomeController.hottestTopicsNameList[index],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              "https://img.freepik.com/free-photo/front-view-blurry-lawyer-working_23-2151202427.jpg?t=st=1708603817~exp=1708607417~hmac=18b4560dc0c9239580c7932972e2ca55b6c9486563ac37f77fd6f6d9f20933db&w=740",
                              height: 150,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Supreme Court consider restitution if time make relief unattainable",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: const TextSpan(
                                text:
                                    "News app cartoon smartphone interface templates vector image News app cartoon smartphone interface templates vector image News app cartoon smartphone interface templates vector image ...",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black38,
                                ),
                                children: [
                                  TextSpan(
                                      text: " Read more",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.deepOrange,
                                      ))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                    () => Visibility(
                  visible: newsHomeController.isTourDialogVisible.value,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Want to take a tour of the app?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () => newsHomeController.onMenuClick(context),
                            color: Colors.green,
                            child: const Text("Yes"),
                          ),
                          MaterialButton(
                            onPressed: () {
                              newsHomeController.isTourDialogVisible.value = false;
                            },
                            color: Colors.red,
                            child: const Text("No"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
