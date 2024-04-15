import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/sliver/components/profile.component.dart';
import 'package:untitled/modules/sliver/controller/sliver.controller.dart';

class SliverView extends StatelessWidget {
  SliverView({super.key});

  final SliverController sliverController = Get.put(SliverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.black,
        title: Text(
          "Sliver".tr,
          style: const TextStyle(
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
              const SliverAppBar(
                collapsedHeight: 280,
                expandedHeight: 280,
                flexibleSpace: ProfileComponent(),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: MyDelegate(
                  TabBar(
                    onTap: (value) {
                      print(value);
                    },
                    tabs: const [
                      Tab(text: "Upcoming"),
                      Tab(text: "Running"),
                    ],
                    indicatorColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.blue,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // controller: sliverController.tabController,
            children: [1, 2]
                .map(
                  (e) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
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
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 220, child: tabBar),
          const Icon(Icons.filter_alt_outlined, size: 24, color: Colors.grey),
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
