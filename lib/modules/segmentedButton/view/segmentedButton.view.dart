import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SegmentedButtonView extends StatelessWidget {
  const SegmentedButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Title",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deposit Problem",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
              const Flexible(child: SizedBox(width: double.infinity,)),
              const Center(
                child: Text(
                  "Center"
                ),
              ),
              const Flexible(child: SizedBox(width: double.infinity,)),
              Container(
                height: 50,
                width: 150,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
