import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/api/call.api.dart';
import 'package:untitled/api/url.api.dart';
import 'package:untitled/helpers/regex.helper.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import '../../../helpers/loadingPage.helper.dart';
import '../../../models/response.model.dart';
import '../../../utils/routes.util.dart';
import '../../edeptoOTP/view/edeptoOTP.view.dart';

class EdeptoLoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();


  onSubmit() async {
    print("Submit");

    if (RegExHelper.phoneNumber(phoneNumberController.text)) {
      LoadingPage.show();
      var res = await ApiCall.get(UrlApi.studentLogin + phoneNumberController.text);
      LoadingPage.close();
      ResponseModel loginRes = ResponseModel.fromJson(res);

      if (loginRes.responseCode == 200) {
        RoutesUtil.to(
          () => EdeptoOTPView(
            phoneNumber: phoneNumberController.text,
            id: loginRes.data!,
          ),
        );
      } else {
        SnackbarHelper.error(loginRes.message);
      }
    } else {
      SnackbarHelper.error("Enter a valid phone number");
    }
  }
}
