import 'package:flutter/material.dart';
import 'package:untitled/utils/breakPoints.utils.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.mobileBody, required this.tabletBody, required this.desktopBody});

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimension){
         if(dimension.maxWidth < BreakPointUtils.kTabletBreakpoint){
           return mobileBody;
         }
         else if(dimension.maxWidth >= BreakPointUtils.kTabletBreakpoint && dimension.maxWidth < BreakPointUtils.kDesktopBreakpoint){
           return tabletBody ?? mobileBody;
         }
         else{
           return desktopBody ?? mobileBody;
         }
      },
    );
  }
}
