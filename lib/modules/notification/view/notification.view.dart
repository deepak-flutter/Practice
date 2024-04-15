import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/notification/controller/notification.controller.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  
  final NotificationController notificationController = NotificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.primaryContainer,
        title: Text(
          "Notification".tr,
          style: TextStyle(
            color: context.theme.colorScheme.onPrimaryContainer,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(
          () => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: notificationController.notificationList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Dismissible(
                    key: Key(notificationController.notificationList[index]),
                    onDismissed: (direction) => notificationController.onDismissed(direction, index),
                    onUpdate: (details) {
                      print(details);
                    },
                  dragStartBehavior: DragStartBehavior.down,
                    direction: DismissDirection.horizontal,
                    background: Container(
                      height: 92,
                      width: double.infinity,
                      padding: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            color: Color.fromARGB(1, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.delete_outline_rounded, size: 20, color: Colors.white,),
                    ),
                    secondaryBackground: Container(
                      height: 92,
                      width: double.infinity,
                      padding: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            color: Color.fromARGB(1, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.delete_outline_rounded, size: 20, color: Colors.white,),
                    ),
                    child: Container(
                      height: 92,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            color: Color.fromARGB(1, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: Text(
                        "${notificationController.notificationList[index]}",
                      ),
                    ),
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
