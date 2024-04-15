import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:untitled/utils/assets.utils.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        title: const Text(
          "Title",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: ResponsiveVisibility(
          visible: false,
          visibleConditions: const [Condition.equals(name: MOBILE, value: false)],
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded, size: 18, color: Colors.white),
          ),
        ),
        actions: [
          const ResponsiveVisibility(
            hiddenConditions: [Condition.equals(name: MOBILE, value: false)],
            child: MenuItemButton(
              child: Text("Home", style: TextStyle(color: Colors.white)),
            ),
          ),
          const ResponsiveVisibility(
            hiddenConditions: [Condition.equals(name: MOBILE, value: false)],
            child: MenuItemButton(
                child: Text("Courses", style: TextStyle(color: Colors.white))),
          ),
          const ResponsiveVisibility(
            hiddenConditions: [Condition.equals(name: MOBILE, value: false)],
            child: MenuItemButton(
                child: Text("About", style: TextStyle(color: Colors.white))),
          ),
          const ResponsiveVisibility(
            hiddenConditions: [Condition.equals(name: MOBILE, value: false)],
            child: MenuItemButton(
                child:
                    Text("Contact Us", style: TextStyle(color: Colors.white))),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Heading",
            style: TextStyle(
              fontSize: ResponsiveValue(context,
                  defaultValue: 20.0,
                  conditionalValues: [
                    Condition.largerThan(name: MOBILE, value: 32.0),
                    Condition.largerThan(name: TABLET, value: 48.0),
                  ]).value,
              fontWeight: ResponsiveValue(context,
                defaultValue: FontWeight.w200, conditionalValues: [
                  Condition.largerThan(name: MOBILE, value: FontWeight.w400),
                  Condition.largerThan(name: TABLET, value: FontWeight.w600),
                ],
              ).value,
              color: Colors.blue,
            ),
          ),
          ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).isMobile
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowPadding: const EdgeInsets.symmetric(horizontal: 20),
            columnMainAxisAlignment: MainAxisAlignment.spaceAround,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            columnSpacing: 20,
            columnPadding: const EdgeInsets.symmetric(horizontal: 20),
            rowSpacing: 20,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Image.asset(AssetsUtils.getTiger()),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Image.asset(AssetsUtils.getTiger()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
