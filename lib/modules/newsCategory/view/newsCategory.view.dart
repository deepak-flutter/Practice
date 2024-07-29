import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/newsCategory/controller/newsCategory.controller.dart';

class NewsCategoryView extends StatelessWidget {
  NewsCategoryView({super.key});

  final NewsCategoryController newsCategoryController =
      NewsCategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Category"),
        actions: [
          IconButton(
            onPressed: () {
              print("back");
              Get.backLegacy(times: 2);
            },
            icon: const Icon(Icons.backspace_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: newsCategoryController.categoryList
            .map((e) => MaterialButton(
                  onPressed: () => newsCategoryController.onClick(e),
                  minWidth: 0,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green,
                    ),
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
