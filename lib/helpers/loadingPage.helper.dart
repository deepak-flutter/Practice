import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage {
  static bool isLoading = false;

  static Future<dynamic> show() {
    print("Show Loader");

    if(isLoading){
      return Future.value();
    }

    isLoading = true;

    showDialog(
      context: Get.context!,
      builder: (context) {
        return const Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // child: Shimmer.fromColors(
          //   baseColor: Colors.grey[100]!,
          //   highlightColor: Colors.white,
          //   child: ListView(
          //     padding: const EdgeInsets.only(top: 60),
          //     children: [
          //       SizedBox(
          //         height: 30,
          //         child: ListView.separated(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           itemCount: 5,
          //           scrollDirection: Axis.horizontal,
          //           separatorBuilder: (context, index) => const SizedBox(width: 20),
          //           itemBuilder: (context, index) {
          //             return Container(
          //               height: 5,
          //               width: 80,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(50),
          //                 color: Colors.black38,
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //       ListView.separated(
          //         primary: false,
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          //         itemCount: 3,
          //         separatorBuilder: (context, index) => const SizedBox(
          //           height: 40,
          //         ),
          //         itemBuilder: (context, index) {
          //           return SizedBox(
          //             height: 260,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: 180,
          //                   width: double.infinity,
          //                   decoration: BoxDecoration(
          //                       color: Colors.black38,
          //                       borderRadius: BorderRadius.circular(10)),
          //                 ),
          //                 Container(
          //                   height: 25,
          //                   width: double.infinity,
          //                   decoration: BoxDecoration(
          //                       color: Colors.black38,
          //                       borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 Row(
          //                   children: [
          //                     const CircleAvatar(
          //                       backgroundColor: Colors.black38,
          //                       radius: 20,
          //                     ),
          //                     const SizedBox(width: 10),
          //                     Container(
          //                       height: 25,
          //                       width: 120,
          //                       decoration: BoxDecoration(
          //                           color: Colors.black38,
          //                           borderRadius: BorderRadius.circular(5)),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          child: Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );


    return Future.value();
  }

  static close() {
    print("Close loader ");
    if(isLoading){
      Navigator.pop(Get.context!);
      isLoading = false;
    }
  }
}
