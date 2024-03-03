import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/notification/controller/notification_controller.dart';

class NotificationDetails extends StatelessWidget {
  final int index;
  NotificationDetails({super.key, required this.index});

  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      // color: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            notificationController.isEditSelected.value
                ? Checkbox(
                    value: notificationController
                        .selectedNotification[index].isSelected,
                    onChanged: (bool? value) {
                      notificationController
                          .selectedNotification[index].isSelected = value;
                      notificationController.checkIsAllSelected();
                      notificationController.setUpdate();
                    })
                : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    showDot(),
                    Text(
                      notificationController.notificationList[index].title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    notificationController.notificationList[index].description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showDot() {
    return notificationController.notificationList[index].readStatus == "No"
        ? Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: 18),
          );
  }
}
