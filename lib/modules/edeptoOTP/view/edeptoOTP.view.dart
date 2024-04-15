import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/modules/edeptoOTP/controller/edeptoOTP.controller.dart';

import '../../../utils/assets.utils.dart';

class EdeptoOTPView extends StatelessWidget {
  EdeptoOTPView({super.key, required this.phoneNumber, required this.id}) {
    edeptoOTPController.countDownTimer();
  }

  final String phoneNumber;
  final String id;
  final EdeptoOTPController edeptoOTPController = EdeptoOTPController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        title: const Text(
          "Verify OTP",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
        children: [
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(AssetsUtils.getLogo()),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Enter the OTP you Received to",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Text(
            "+91 $phoneNumber",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          PinCodeTextField(
            appContext: context,
            controller: edeptoOTPController.otpController,
            onCompleted: (value) => edeptoOTPController.onSubmit(id, value),
            length: 6,
            keyboardType: TextInputType.number,
            blinkWhenObscuring: true,
            cursorColor: Colors.black,
            enablePinAutofill: true,
            enableActiveFill: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.grey.shade200,
              inactiveFillColor: Colors.grey.shade200,
              selectedFillColor: Colors.grey.shade300,
              inactiveColor: Colors.transparent,
              selectedColor: Colors.grey,
              activeColor: Colors.grey,
              inactiveBorderWidth: 0,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => edeptoOTPController.isTimerVisible.value
                ? Text(
                    "Resend OTP in ${edeptoOTPController.count.value} seconds",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  )
                : TextButton(
                    onPressed: () =>
                        edeptoOTPController.onResendOtpClick(phoneNumber),
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      minimumSize: MaterialStatePropertyAll(Size.zero),
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
