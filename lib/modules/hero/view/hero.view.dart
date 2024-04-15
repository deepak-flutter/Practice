import 'package:flutter/material.dart';
import 'package:untitled/modules/hero/components/pageDetails.component.dart';
import 'package:untitled/utils/assets.utils.dart';

class HeroView extends StatelessWidget {
  const HeroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        title: const Text(
          "Hero",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageDetailsComponent()));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Hero(
            tag: "tiger",
            transitionOnUserGestures: true,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Image.asset(
                  AssetsUtils.getTiger(),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                )),
          ),
        ),
      ),
    );
  }
}
