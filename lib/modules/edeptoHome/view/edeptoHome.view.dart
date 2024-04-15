import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/helpers/cacheNetworkImage.helper.dart';
import 'package:untitled/modules/edeptoHome/controller/edeptoHome.controller.dart';
import '../../../components/megaPassCard/megaPassCard.component.dart';

class EdeptoHomeView extends StatelessWidget {
  EdeptoHomeView({super.key});

  final EdeptoHomeController edeptoHomeController = EdeptoHomeController();

  @override
  Widget build(BuildContext context) {
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
        controller: edeptoHomeController.scrollController,
        padding: const EdgeInsets.only(bottom: 15),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mega Pass Offer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () => edeptoHomeController.onViewAllClick(),
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      minimumSize: MaterialStatePropertyAll(Size.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 164,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: 290,
                    child: MegaPassCardComponent(
                        onBuyNowClick: edeptoHomeController.onBuyNowClick,
                        onExamDetailsClick:
                            edeptoHomeController.onBuyNowClick));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "All Category",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Obx(
            () => GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              itemCount: edeptoHomeController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: ()=>edeptoHomeController.onCategoryCardClick(edeptoHomeController.categoryList[index].id!),
                        minWidth: 0,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Container(
                          height: 80,
                          width: 90,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade200,
                          ),
                          child: CacheNetworkImageHelper.getImage(edeptoHomeController.categoryList[index].icon ?? ""),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        edeptoHomeController.categoryList[index].categoryName ?? "",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Obx(
            () => Visibility(
              visible: edeptoHomeController.isLoading.value,
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
