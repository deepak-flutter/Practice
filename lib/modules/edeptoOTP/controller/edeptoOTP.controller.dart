import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/api/url.api.dart';
import 'package:untitled/helpers/regex.helper.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import 'package:untitled/models/student.model.dart';
import 'package:untitled/modules/edeptoHome/view/edeptoHome.view.dart';
import '../../../api/call.api.dart';
import '../../../helpers/loadingPage.helper.dart';
import '../../../helpers/sharedPreferences.helper.dart';
import '../../../models/response.model.dart';
import '../../../utils/const.utils.dart';
import '../../../utils/routes.util.dart';

class EdeptoOTPController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxInt count = 10.obs;
  RxBool isTimerVisible = true.obs;
  late Timer timer;


  onSubmit(String id, String otp) async {

    if (RegExHelper.otp(otp)) {
      LoadingPage.show();
      var res = await ApiCall.get("${UrlApi.otpVerify}$id/$otp");
      LoadingPage.close();

      StudentModel studentRes = StudentModel.fromJson(res);

      if (studentRes.responseCode == 200) {
        isTimerVisible.value = false;
        cancelTimer();
        SharedPreferencesHelper.instance.setString(ConstUtils.autoLoginId, studentRes.data?.autoLoginToken ?? "");
        SharedPreferencesHelper.instance.setString(ConstUtils.studentId, studentRes.data?.id ?? "");

        RoutesUtil.to(()=>EdeptoHomeView());
        // RoutesUtil.to(()=>EdeptoProfileView());
      }
      else {
        SnackbarHelper.error(studentRes.message);
      }
    } else {
      SnackbarHelper.error("Enter valid OTP");
    }
  }

  onResendOtpClick(String phoneNumber) async {
    print("Resend OTP");

    LoadingPage.show();
    var res = await ApiCall.get(UrlApi.studentLogin + phoneNumber);
    LoadingPage.close();

    ResponseModel loginRes = ResponseModel.fromJson(res);

    if (loginRes.responseCode == 200) {
      isTimerVisible.value = true;
      countDownTimer();
    } else {
      SnackbarHelper.error(loginRes.message);
    }
  }

  void countDownTimer() {
    print("Timer start");
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count.value > 0) {
          count.value--;
        } else {
          count.value = 10;
          isTimerVisible.value = false;
          cancelTimer();
        }
        print(count.value);
      },
    );
  }

  cancelTimer() {
    timer.cancel();
    print("Cancel Timer");
  }
}
