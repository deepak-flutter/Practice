import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FlexibleSpaceComponent extends StatelessWidget {
  const FlexibleSpaceComponent({
    super.key,
    required this.sliderIndex,
    required this.onBannerClick,
    required this.onViewAllClick,
    required this.onRematchClick,
    required this.selectedLiveChallengesText,
    required this.onAllClick,
    required this.onUNIBITClick,
  });

  final RxInt sliderIndex;
  final RxInt selectedLiveChallengesText;
  final Function onBannerClick;
  final Function onViewAllClick;
  final Function onRematchClick;
  final Function onAllClick;
  final Function onUNIBITClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //......My Challenge Horizontal Listview with My Challenge card.
        SizedBox(
          height: 155,
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: 141,
                width: 200,
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                        color: context.theme.colorScheme.shadow,
                        offset: const Offset(0, 4),
                        blurRadius: 3)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "LG-14201312",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: context.theme.colorScheme.onBackground,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: context.theme.colorScheme.outline,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
          ),
        ),
        //......Live Challenge Heading and All and Unibit button
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Text(
            "Live Challenges".tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.theme.colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
