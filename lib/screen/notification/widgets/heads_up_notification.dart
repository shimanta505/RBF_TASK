import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/notification/controller/notification_controller.dart';

class HeadsUpNotification extends StatelessWidget {
  HeadsUpNotification({super.key});

  final notificationController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          //  color: Colors.green,
          ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.notifications,
            size: 28,
            color: Colors.black,
          ),
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 1,
              child: Obx(
                () => Text(
                  notificationController.unreadNotifications.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
