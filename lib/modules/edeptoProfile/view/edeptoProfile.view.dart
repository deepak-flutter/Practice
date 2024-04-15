import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/components/dropDownField/dropDownField.component.dart';
import 'package:untitled/components/inputField/InputFieldSuffixIcon.component.dart';
import 'package:untitled/components/inputField/inputField.component.dart';
import 'package:untitled/components/mainButton/mainButton.component.dart';
import 'package:untitled/modules/edeptoProfile/controller/edeptoProfile.controller.dart';

class EdeptoProfileView extends StatelessWidget {
  EdeptoProfileView({super.key});

  final EdeptoProfileController edeptoProfileController =
      EdeptoProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const Text(
            "General Details",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          // ------ Full Name
          const Text(
            "Full Name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldComponent(
            controller: edeptoProfileController.nameController,
            inputType: TextInputType.text,
            maxLength: 50,
            hintText: "Deepak",
          ),
          const SizedBox(height: 20),
          // ------ Mobile Number
          const Text(
            "Mobile No.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldComponent(
            controller: edeptoProfileController.mobileNumberController,
            inputType: TextInputType.number,
            maxLength: 10,
            hintText: "9999999999",
          ),
          const SizedBox(height: 20),
          // ------ Email Address
          const Text(
            "Email Address",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldComponent(
            controller: edeptoProfileController.emailController,
            inputType: TextInputType.emailAddress,
            maxLength: 80,
            hintText: "example@email.com",
          ),
          const SizedBox(height: 20),
          // ------ Date of Birth
          const Text(
            "Date of Birth",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldSuffixIconComponent(
            hintText: "Select your DOB",
            inputController: edeptoProfileController.dobController,
            icon: Icons.date_range_rounded,
            fillColor: Colors.transparent,
            borderColor: Colors.black38,
            borderRadius: 10,
            onTap: ()=>edeptoProfileController.onDatePick(context),
            readOnly: true,
          ),
          const SizedBox(height: 20),
          // ------ Category
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          DropDownFieldComponent(
            items: edeptoProfileController.categoryList,
            onChanged: (p0) => edeptoProfileController.onCategorySelect(p0!),
            dropdownValue: edeptoProfileController.categoryController,
            hintText: "Select category",
            maxHeight: 150,
            borderRadius: 10,
            fillColor: context.theme.colorScheme.background,
            borderColor: Colors.black38,
            dropdownTextColor: Colors.black,
          ),
          const SizedBox(height: 20),
          // ------ State
          const Text(
            "State",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          DropDownFieldComponent(
            items: edeptoProfileController.stateList,
            onChanged: (p0) => edeptoProfileController.onStateSelect(p0!),
            dropdownValue: edeptoProfileController.stateController,
            hintText: "Select state",
            maxHeight: 200,
            borderRadius: 10,
            fillColor: context.theme.colorScheme.background,
            borderColor: Colors.black38,
            dropdownTextColor: Colors.black,
          ),
          const SizedBox(height: 20),
          // ------ City
          const Text(
            "Enter city",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldComponent(
            controller: edeptoProfileController.cityController,
            inputType: TextInputType.text,
            maxLength: 80,
            hintText: "Enter city",
          ),
          const SizedBox(height: 20),
          // ------ Pin Code
          const Text(
            "Pin Code",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          InputFieldComponent(
            controller: edeptoProfileController.pinCodeController,
            inputType: TextInputType.number,
            maxLength: 6,
            hintText: "Enter piin code",
          ),
          const SizedBox(height: 20),
          // ------ Language
          const Text(
            "Language",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          DropDownFieldComponent(
            items: edeptoProfileController.languageList,
            onChanged: (p0) => edeptoProfileController.onLanguageSelect(p0!),
            dropdownValue: edeptoProfileController.languageController,
            hintText: "Select language",
            maxHeight: 100,
            borderRadius: 10,
            fillColor: context.theme.colorScheme.background,
            borderColor: Colors.black38,
            dropdownTextColor: Colors.black,
          ),
          const SizedBox(height: 20),

          // ------ Submit Button
          MainButtonComponent(
              onClick: () => edeptoProfileController.onSubmitClick(),
              text: "Sumbit"),
        ],
      ),
    );
  }
}
