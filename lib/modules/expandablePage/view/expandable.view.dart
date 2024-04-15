import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class ExpandableView extends StatelessWidget {
  const ExpandableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          "Expandable Page View",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          const Text("data"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 50, width: 100, color: Colors.red),
              Container(height: 50, width: 100, color: Colors.red),
              Container(height: 50, width: 100, color: Colors.red),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 250,
                color: Colors.green,
                margin: const EdgeInsets.only(bottom: 10),
              );
            },
          ),
        ],
      ),
    );
  }
}
