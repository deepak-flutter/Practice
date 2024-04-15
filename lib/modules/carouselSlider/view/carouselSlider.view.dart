import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/carouselSlider/controller/carouselSlider.controller.dart';

class CarouselSliderView extends StatelessWidget {
  CarouselSliderView({super.key});

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Carousel Slider".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Text("data"),
          SizedBox(
            height: 200,
            child: ListView.separated(
              controller: carouselSliderController.listScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.red,
                  height: 80,
                  width: 150,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
