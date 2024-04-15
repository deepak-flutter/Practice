import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/helpers/cacheNetworkImage.helper.dart';
import 'package:untitled/modules/hive/controller/hive.controller.dart';
import 'package:untitled/utils/assets.utils.dart';

class HiveView extends StatelessWidget {
  HiveView({super.key});

  final HiveController hiveController = HiveController();

  @override
  Widget build(BuildContext context) {
    hiveController.init();
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: hiveController.newsList!.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  hiveController.newsList?[index].urlToImage != null
                      ? Image.network(
                          hiveController.newsList![index].urlToImage!,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(AssetsUtils.getTiger()),
                        )
                      : Image.asset(AssetsUtils.getFlower()),
                  Text(
                    hiveController.newsList?[index].title ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    hiveController.newsList?[index].description ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
