import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class StackedCarouselView extends StatelessWidget {
  const StackedCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text("Stacked Carousel"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Swiper(
              loop: true,
              itemCount: 10,
              itemWidth: 300,
              itemHeight: 300,
              itemBuilder: (context, index) => Container(height: 200, width: 280, color: Colors.blue, child: Center(child: Text("$index", style: TextStyle(fontSize: 30),),),),
              layout: SwiperLayout.TINDER,
              controller: SwiperController(),
              index: 9,
            ),
          )
        ],
      ),
    );
  }
}
