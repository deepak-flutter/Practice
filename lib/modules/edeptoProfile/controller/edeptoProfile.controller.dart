import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/api/url.api.dart';
import 'package:untitled/helpers/regex.helper.dart';
import 'package:untitled/helpers/snackbar.helper.dart';
import 'package:untitled/models/profile.model.dart';

import '../../../api/call.api.dart';
import '../../../helpers/dateFormat.helper.dart';
import '../../../helpers/loadingPage.helper.dart';

class EdeptoProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  List<String> categoryList = ["General", "OBC", "SC", "ST"];
  List<String> stateList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chattisgarh",
    "Goa",
    "Gujrat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhank",
    "Karnataka",
    "Kerala"
  ];
  List<String> languageList = ["English", "Hindi"];

  RxString categoryController = "General".obs;
  RxString stateController = "".obs;
  RxString languageController = "English".obs;

  late DateTime dobFormat;

  onDatePick(context) async {
    DateTime? pickedDate = await showDialog(
      context: context,
      builder: (context) => DatePickerDialog(
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        currentDate: DateTime.now(),
      ),
    );
    if (pickedDate != null) {
      dobController.text = DateFormatHelper.dateTimeConverter(pickedDate);
      dobFormat = pickedDate;
    }
  }

  onCategorySelect(String value) {
    print("Category: $value");
    categoryController.value = value;
  }

  onStateSelect(String value) {
    print("State: $value");
    stateController.value = value;
  }

  onLanguageSelect(String value) {
    print("Language: $value");
    languageController.value = value;
  }

  onSubmitClick() async {
    print("Submit");
    print("Name: ${nameController.text}"
        "\nMobile Number: ${mobileNumberController.text}"
        "\nEmail: ${emailController.text}"
        "\nDOB: $dobFormat"
        "\nCategory: ${categoryController.value}"
        "\nState: ${stateController.value}"
        "\nCity: ${cityController.text}"
        "\nPin Code: ${pinCodeController.text}"
        "\nLanguage: ${languageController.value}");

    Map<String, dynamic> studentDetails = {};

    if (nameController.text.isNotEmpty) {
      if (RegExHelper.name(nameController.text.trim())) {
        studentDetails["name"] = nameController.text.trim();
      }
    } else {
      SnackbarHelper.error("Please enter valid name");
      return;
    }

    if (emailController.text.isNotEmpty) {
      if (RegExHelper.email(emailController.text.trim())) {
        studentDetails["emailId"] = emailController.text.trim();
      }
    } else {
      SnackbarHelper.error("Please enter valid email address");
      return;
    }

    if (dobFormat.toString().isNotEmpty) {
      studentDetails["dob"] = dobFormat.toString().substring(0, 10);
    } else {
      SnackbarHelper.error("Please enter dob");
      return;
    }

    if (categoryController.value.isNotEmpty) {
      studentDetails["category"] = categoryList.indexOf(categoryController.value) + 1;
    }

    // if (stateController.value.isNotEmpty) {
    //   studentDetails["state"] = stateController.value;
    // } else {
    //   SnackbarHelper.error("Please enter state name");
    //   return;
    // }

    if (cityController.text.isNotEmpty) {
      if (RegExHelper.city(cityController.text.trim())) {
        studentDetails["city"] = cityController.text.trim();
      }
    } else {
      SnackbarHelper.error("Please enter valid city name");
      return;
    }

    if (pinCodeController.text.isNotEmpty) {
      if (RegExHelper.otp(pinCodeController.text)) {
        studentDetails["pincode"] = pinCodeController.text.trim();
      }
    } else {
      SnackbarHelper.error("Enter valid Pin Code");
      return;
    }

    // if (languageController.value.isNotEmpty) {
    //   studentDetails["language"] = languageController.value;
    //   return;
    // }

    LoadingPage.show();
    var res = await ApiCall.put(UrlApi.profileUpdate, studentDetails);
    LoadingPage.close();

    ProfileModel profileRes = ProfileModel.fromJson(res);


    if(profileRes.responseCode == 200){
      SnackbarHelper.success(profileRes.message);
    }
    else{
      SnackbarHelper.error(profileRes.message);
    }

    print("object");
  }
}
