import 'package:flutter/material.dart';
import 'package:untitled/modules/future/controller/future.controller.dart';

class FutureView extends StatelessWidget {
  FutureView({super.key});

  final FutureController futureController = FutureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      body: Center(
        child: FutureBuilder(
          future: futureController.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    snapshot.requireData,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
