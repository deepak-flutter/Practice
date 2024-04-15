import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/fontChange/controller/fontChange.controller.dart';

import '../../../utils/assets.utils.dart';

class FontChangeView extends StatelessWidget {
  FontChangeView({super.key});
  final FontChangeController fontChangeController = FontChangeController();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: fontChangeController.currentFontFamily,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: const Color(0xFF000000),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              AssetsUtils.getHomeLogo(),
              height: 45,
              width: 45,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                CupertinoIcons.bell,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            DropdownSearch(
              items: fontChangeController.fontFamilyList,
              onChanged: (value) => fontChangeController.onSelect(value!),
              selectedItem: fontChangeController.selectedItem,
            ),
            const SizedBox(height: 20),
             const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
