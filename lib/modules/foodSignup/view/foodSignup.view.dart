import 'package:flutter/material.dart';
import 'package:untitled/modules/foodSignup/components/foodSignup.controller.dart';

class FoodSignupView extends StatelessWidget {
  FoodSignupView({super.key});

  final FoodSignupController foodSignupController = FoodSignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
          Text(
            "Signup",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
