import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  RxList notificationList = ["Apple", "Banana", "Strawberry", "Banana", "Grapes", "Pomegranate", "Mango", "Cucumber", "Pumpkin"].obs;

  onDismissed(DismissDirection direction, int index){
    print(direction);

    notificationList.removeAt(index);
    print(notificationList);
  }
}