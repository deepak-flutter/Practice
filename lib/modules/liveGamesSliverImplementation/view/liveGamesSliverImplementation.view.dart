import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/flexibleSpace.component.dart';
import '../controller/liveGamesSliverImplementation.controller.dart';

class LiveGamesSliverImplementationView extends StatelessWidget {
  LiveGamesSliverImplementationView({super.key});

  final LiveGamesSliverImplementationController liveGamesSliverImplementationController = LiveGamesSliverImplementationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          "Live Games",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: context.theme.colorScheme.background,
                collapsedHeight: 315,
                expandedHeight: 315,
                flexibleSpace: FlexibleSpaceComponent(
                  sliderIndex:
                      liveGamesSliverImplementationController.carouselDot,
                  onBannerClick:
                      liveGamesSliverImplementationController.onBannerClick,
                  onAllClick:
                      liveGamesSliverImplementationController.onAllClick,
                  onRematchClick:
                      liveGamesSliverImplementationController.onRematchClick,
                  onUNIBITClick:
                      liveGamesSliverImplementationController.onUNIBITClick,
                  onViewAllClick:
                      liveGamesSliverImplementationController.onViewAllClick,
                  selectedLiveChallengesText:
                      liveGamesSliverImplementationController
                          .selectedLiveChallengesText,
                ),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: MyDelegate(
                  tabBar: TabBar(
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: "Upcoming"),
                      Tab(text: "Running"),
                    ],
                    unselectedLabelColor:
                        context.theme.colorScheme.onSurfaceVariant,
                    labelColor: context.theme.colorScheme.secondary,
                    labelPadding: EdgeInsets.zero,
                    dividerHeight: 2,
                    dividerColor: context.theme.colorScheme.surfaceVariant,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: context.theme.colorScheme.secondary,
                          width: 2,
                        ),
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  onFilterButtonClick: liveGamesSliverImplementationController
                      .onFilterButtonClick,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [1, 2]
                .map(
                  (e) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Text(
                            "$e",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                      itemCount: 20,
                    ),

                )
                .toList(),
          ),
        ),
      ),
    );
  }
}


class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate({required this.tabBar, required this.onFilterButtonClick});

  final TabBar tabBar;
  final Function onFilterButtonClick;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: context.theme.colorScheme.background,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 180, child: tabBar),
          IconButton(
            onPressed: () => onFilterButtonClick(context),
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 24,
              color: context.theme.colorScheme.onSurfaceVariant,
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
