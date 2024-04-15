import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/modules/shimmerEffect/controller/shimmerEffect.controller.dart';

class ShimmerEffectView extends StatelessWidget {
  ShimmerEffectView({super.key});

  final ShimmerEffectController shimmerEffectController = ShimmerEffectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.only(top: 60),
          children: [
            SizedBox(
              height: 30,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 5,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                    ),
                  );
                },
              
              
              ),
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(
                height: 40,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: 25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 25,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
