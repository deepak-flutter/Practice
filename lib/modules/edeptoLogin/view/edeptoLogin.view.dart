import 'package:flutter/material.dart';
import 'package:untitled/modules/edeptoLogin/controller/edeptoLogin.controller.dart';
import 'package:untitled/utils/assets.utils.dart';

import '../../../components/inputField/inputField.component.dart';
import '../../../components/mainButton/mainButton.component.dart';

class EdeptoLoginView extends StatelessWidget {
  EdeptoLoginView({super.key});

  final EdeptoLoginController edeptoLoginController = EdeptoLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        children: [
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(AssetsUtils.getLogo()),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 100),
          const Text(
            "Log in",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Phone Number",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          InputFieldComponent(
            controller: edeptoLoginController.phoneNumberController,
            inputType: TextInputType.number,
            maxLength: 10,
            hintText: "Phone Number",
          ),
          const SizedBox(height: 10),
          MainButtonComponent(
              onClick: () => edeptoLoginController.onSubmit(), text: "Submit"),
          const SizedBox(height: 10),
          const Text(
            "A 6 digit OTP will be sent via SMS to Verify your mobile number",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
