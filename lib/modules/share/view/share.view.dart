import 'package:flutter/material.dart';
import 'package:untitled/modules/share/controller/share.controller.dart';

class ShareView extends StatelessWidget {
  ShareView({super.key});

  final ShareController shareController = ShareController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            readOnly: true,
            onTap: () => shareController.onShareClick("title"),
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.share_rounded, size: 20,),
              hintText: "APQ848",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
