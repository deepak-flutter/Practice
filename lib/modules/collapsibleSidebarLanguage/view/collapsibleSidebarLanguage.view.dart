import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/collapsibleSidebarLanguage/controller/collapsibleSidebarLanguage.controller.dart';
import 'package:untitled/utils/assets.utils.dart';

class CollapsibleSidebarLanguageView extends StatelessWidget {CollapsibleSidebarLanguageView({super.key, this.category = "general"});

  String category = "";
  final CollapsibleSidebarLanguageController
      collapsibleSidebarLanguageController =
      CollapsibleSidebarLanguageController();

  @override
  Widget build(BuildContext context) {
    collapsibleSidebarLanguageController.init(category);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: PageView.builder(
        itemCount: collapsibleSidebarLanguageController.newsHeadlineList.length,
        controller: collapsibleSidebarLanguageController.pageController,
        scrollBehavior: const ScrollBehavior(),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) =>
            collapsibleSidebarLanguageController.onPageChange(value),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://st.depositphotos.com/1006899/2650/i/950/depositphotos_26505551-stock-photo-error-metaphor.jpg",
                      errorWidget: (context, url, error) => Image.asset(
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(0, 0),
                                spreadRadius: 1)
                          ]),
                      child: Text(
                        collapsibleSidebarLanguageController
                            .languageList[index],
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
                collapsibleSidebarLanguageController.newsHeadlineList[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                collapsibleSidebarLanguageController.newsContentList[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Published on: ",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              const Flexible(child: SizedBox(height: double.infinity)),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: MaterialButton(
                  onPressed: () => collapsibleSidebarLanguageController.speak(
                      collapsibleSidebarLanguageController
                          .newsContentList[index],
                      collapsibleSidebarLanguageController.languageList[index]),
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
                        collapsibleSidebarLanguageController.isPlaying.value
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => {},
                minWidth: 0,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                child: Container(
                  height: 20,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black,
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage(AssetsUtils.getTiger()),
                      fit: BoxFit.fitWidth,
                      opacity: 0.25,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
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
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => AnimatedContainer(
      //     padding: const EdgeInsets.symmetric(horizontal: 30),
      //     height: collapsibleSidebarLanguageController.isBottomBarVisible.value
      //         ? 60
      //         : 0,
      //     duration: const Duration(milliseconds: 200),
      //     color: Colors.transparent,
      //     foregroundDecoration: const BoxDecoration(color: Colors.transparent),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         const Icon(Icons.home, size: 30),
      //         const Icon(Icons.search_rounded, size: 30),
      //         IconButton(
      //             onPressed: () => {RoutesUtil.to(() => NewsCategoryView())},
      //             icon: const Icon(Icons.category_outlined, size: 30)),
      //         const Icon(Icons.bookmark_add, size: 30),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 50,
        stiffness: 100,
        damping: 0.8,
      );
}

// ----------Two Component--------
// --------Youtube Player--------
// YoutubePlayer(
//   controller:
//       collapsibleSidebarController.youtubeController,
//   aspectRatio: 16 / 9,
// ),
// Container(
//   height: 150,
//   width: double.infinity,
//   decoration: BoxDecoration(
//       borderRadius:
//           const BorderRadius.all(Radius.circular(20)),
//       color: Colors.grey.shade200,
//       image: DecorationImage(
//           image: NetworkImage(
//               e.urlToImage ?? AssetsUtils.getFlower(),
//               scale: 1.1))),
// ),

// --------Collapsible Sidebar--------
// body: CollapsibleSidebar(
//   showTitle: false,
//   fitItemsToBottom: false,
//   customItemOffsetX: 10,
//   customContentPaddingLeft: 5,
//   minWidth: 60,
//   maxWidth: 150,
//   iconSize: 30,
//   itemPadding: 5,
//   showToggleButton: true,
//   backgroundColor: Colors.grey.shade200,
//   screenPadding: 2,
//   toggleButtonIcon: Icons.arrow_back_ios_outlined,
//   selectedIconColor: Colors.grey.shade400,
//   unselectedTextColor: Colors.black38,
//   textStyle: const TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//   ),
//   toggleTitleStyle: const TextStyle(
//       fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
//   sidebarBoxShadow: const [BoxShadow(color: Colors.transparent)],
//   items: [
//     CollapsibleItem(
//       text: "Shop",
//       icon: Icons.shopping_bag,
//       isSelected: true,
//       onPressed: () {
//         print("Shop");
//       },
//     ),
//     CollapsibleItem(
//       isSelected: false,
//       text: "Profile",
//       icon: Icons.person_rounded,
//       onPressed: () {
//         print("Profile");
//       },
//     ),
//     CollapsibleItem(
//       isSelected: false,
//       text: "Contact",
//       icon: Icons.contact_support_rounded,
//       onPressed: () {
//         print("Contact");
//       },
//     ),
//     CollapsibleItem(
//       isSelected: false,
//       text: "Refer",
//       icon: Icons.share,
//       onPressed: () {
//         print("Refer");
//       },
//     ),
//     CollapsibleItem(
//       isSelected: false,
//       text: "Theme",
//       icon: Icons.sunny,
//       onPressed: () {
//         print("Theme change");
//       },
//     ),
//   ],
//   body: Obx(
//     () => PageView(
//       controller: collapsibleSidebarController.pageController,
//       scrollBehavior: const ScrollBehavior(),
//       scrollDirection: Axis.vertical,
//       children: collapsibleSidebarController.newsList!
//           .map(
//             (e) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // YoutubePlayer(
//                   //   controller:
//                   //       collapsibleSidebarController.youtubeController,
//                   //   aspectRatio: 16 / 9,
//                   // ),
//                   // Container(
//                   //   height: 150,
//                   //   width: double.infinity,
//                   //   decoration: BoxDecoration(
//                   //       borderRadius:
//                   //           const BorderRadius.all(Radius.circular(20)),
//                   //       color: Colors.grey.shade200,
//                   //       image: DecorationImage(
//                   //           image: NetworkImage(
//                   //               e.urlToImage ?? AssetsUtils.getFlower(),
//                   //               scale: 1.1))),
//                   // ),
//                   Stack(
//                     children:[
//                       ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         child: Image.network(
//                           e.urlToImage ?? AssetsUtils.getFlower(),
//                           fit: BoxFit.cover,
//                         )),
//                       Positioned(
//                         bottom: 5,
//                         right: 5,
//                         child: Container(
//                           height: 15,
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             color: Colors.white,
//                           ),
//                           child: Text(
//                             "${e.source?.name}",
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "${e.title}",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "${e.content?.split(" [+")[0]}",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "Published on: ${e.publishedAt?.substring(0, 10)}",
//                     style: const TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   const Flexible(
//                       child: SizedBox(height: double.infinity)),
//                   MaterialButton(
//                     onPressed: () => collapsibleSidebarController
//                         .onReadMoreClick(e.url),
//                     minWidth: 0,
//                     padding: EdgeInsets.zero,
//                     visualDensity: VisualDensity.compact,
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(colors: [
//                           Colors.black54,
//                           Colors.black87,
//                         ]),
//                         image: DecorationImage(
//                             image: NetworkImage(e.urlToImage ?? AssetsUtils.getTiger()),
//                             fit: BoxFit.fitWidth,
//                             opacity: 0.3,
//                           filterQuality: FilterQuality.high
//                         ),
//                       ),
//                       child: RichText(
//                         text: TextSpan(
//                           text: "${e.description?.substring(0, 35)}...",
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                           children: const [
//                             TextSpan(
//                               text: "\nTap to know more",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white70
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//           .toList(),
//     ),
//   ),
// ),
