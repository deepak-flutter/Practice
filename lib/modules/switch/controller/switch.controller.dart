import 'package:get/get.dart';

class SwitchController extends GetxController{
  RxBool switchStatus = false.obs;

  onSwitchChange(bool value){
    switchStatus.value = value;
  }
}