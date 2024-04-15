import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/assets.utils.dart';

import '../../../utils/fontFamily.utils.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final FontFamilyUtil fontFamily = FontFamilyUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const Text(
                "Hello, Dipak ",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                AssetsUtils.wavyHand(),
                height: 20,
                width: 20,
                alignment: Alignment.topLeft,
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => fontFamily.onFontFamilyChange('RobotoMono'),
                minWidth: 0,
                padding: const EdgeInsets.all(20),
                visualDensity: VisualDensity.compact,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                color: Colors.blueAccent,
                child: const Text(
                  "RobotoMono",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => fontFamily.onFontFamilyChange('Genos'),
                minWidth: 0,
                padding: const EdgeInsets.all(20),
                visualDensity: VisualDensity.compact,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                color: Colors.blueAccent,
                child: const Text(
                  "Genos",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => fontFamily.onFontFamilyChange('DancingScript'),
                minWidth: 0,
                padding: const EdgeInsets.all(20),
                visualDensity: VisualDensity.compact,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                color: Colors.blueAccent,
                child: const Text(
                  "DancingScript",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
