import 'package:flutter/material.dart';
import 'package:untitled/components/megaPassCard/megaPassCard.component.dart';

class EdeptoMegaPassView extends StatelessWidget {
  const EdeptoMegaPassView(
      {super.key,
      required this.onBuyNowClick,
      required this.onExamDetailsClick});

  final Function onBuyNowClick;
  final Function onExamDetailsClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Mega Pass",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MegaPassCardComponent(
              onBuyNowClick: onBuyNowClick,
              onExamDetailsClick: onExamDetailsClick);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
