import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:untitled/modules/inApp/controller/inApp.controller.dart';

class InAppView extends StatelessWidget {
  InAppView({super.key, required this.url});

  final InAppController inAppController = InAppController();
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(url)),
        ),
        onWebViewCreated: (controller) {
          inAppController.inAppWebViewController = controller;
          print("Web view created");
        },
      )
    );
  }
}
