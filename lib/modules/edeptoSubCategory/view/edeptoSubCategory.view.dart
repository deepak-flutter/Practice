import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/helpers/cacheNetworkImage.helper.dart';
import 'package:untitled/modules/edeptoSubCategory/controller/edeptoSubCategory.controller.dart';
import 'package:untitled/utils/assets.utils.dart';

class EdeptoSubCategoryView extends StatelessWidget {
  EdeptoSubCategoryView({super.key, required this.subCategoryId});

  final String subCategoryId;
  final EdeptoSubCategoryController edeptoSubCategoryController =
      EdeptoSubCategoryController();

  @override
  Widget build(BuildContext context) {
    edeptoSubCategoryController.init(subCategoryId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Edepto",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        controller: edeptoSubCategoryController.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const Text(
            "Test series",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: edeptoSubCategoryController.subCategoryList.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () => edeptoSubCategoryController.onCardClick(),
                  minWidth: 0,
                  padding: const EdgeInsets.all(0),
                  visualDensity: VisualDensity.compact,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: CacheNetworkImageHelper.getImage(
                              edeptoSubCategoryController
                                      .subCategoryList[index].icon ??
                                  ""),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  edeptoSubCategoryController
                                          .subCategoryList[index]
                                          .subCategoryName ??
                                      "",
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        "${(edeptoSubCategoryController.subCategoryList[index].paidTestCount ?? 0) + (edeptoSubCategoryController.subCategoryList[index].freeTestCount ?? 0)} Total test | ",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${edeptoSubCategoryController.subCategoryList[index].totalEnrolled} Enrolled",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () => edeptoSubCategoryController
                                      .onMoreLanguageClick(
                                          edeptoSubCategoryController
                                              .subCategoryList[index]
                                              .languages!),
                                  minWidth: 0,
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: edeptoSubCategoryController
                                          .getLanguage(
                                              edeptoSubCategoryController
                                                      .subCategoryList[index]
                                                      .languages ??
                                                  []),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Colors.blueAccent.withOpacity(0.5),
                                      ),
                                      children: [
                                        const WidgetSpan(
                                            child: SizedBox(width: 5)),
                                        WidgetSpan(
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            padding: const EdgeInsets.all(0),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50)),
                                              color: Colors.blue.shade800,
                                            ),
                                            child: const Icon(Icons.add,
                                                size: 12, color: Colors.white),
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
                        const SizedBox(width: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 30,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          Obx(
                () => Visibility(
              visible: edeptoSubCategoryController.isLoading.value,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
