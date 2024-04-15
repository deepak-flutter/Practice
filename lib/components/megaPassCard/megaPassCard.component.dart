import 'package:flutter/material.dart';

import '../../utils/assets.utils.dart';

class MegaPassCardComponent extends StatelessWidget {
  const MegaPassCardComponent({
    super.key, required this.onBuyNowClick, required this.onExamDetailsClick,
  });

  final Function onBuyNowClick;
  final Function onExamDetailsClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 159,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, right: 58),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  AssetsUtils.getLogo())),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(50)),
                          color: Colors.white60),
                    ),
                    const SizedBox(width: 10),
                    const Flexible(
                      child: Text(
                        "SSC GD Constable Mock Test 2024 (New)",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(Icons.date_range_rounded,
                                  size: 14, color: Colors.grey)),
                          WidgetSpan(child: SizedBox(width: 3)),
                          TextSpan(
                            text: "Validity: ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: "3 Months",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "₹499",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(
                          text: "₹149",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "260 Total | ",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "English, Hindi ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueAccent
                                  .withOpacity(0.5),
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 0,
                                padding: EdgeInsets.zero,
                                visualDensity:
                                VisualDensity.compact,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                materialTapTargetSize:
                                MaterialTapTargetSize
                                    .shrinkWrap,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  padding: const EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(50)),
                                    color: Colors.blueAccent
                                        .withOpacity(0.25),
                                  ),
                                  child: const Icon(Icons.add,
                                      size: 12, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () =>onBuyNowClick(),
                      minWidth: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      visualDensity: VisualDensity.compact,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      color: Colors.blue,
                      height: 20,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(7))),
                      child: const Row(
                        children: [
                          Icon(Icons.shopping_bag,
                              size: 18, color: Colors.white),
                          Text(
                            "BUY NOW",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Offer Expires: ",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "2024-02-25",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () =>onExamDetailsClick(),
                      minWidth: 0,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      materialTapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "Exam Details",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(child: SizedBox(width: 2)),
                            WidgetSpan(
                              alignment:
                              PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 15,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 7, vertical: 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              color: Colors.red,
            ),
            child: const Text(
              "70% OFF",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: -2,
          right: 50,
          child: Image.asset(
            AssetsUtils.getNewRibbon(),
            height: 30,
            width: 50,
          ),
        ),
      ],
    );
  }
}