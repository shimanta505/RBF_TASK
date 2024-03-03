import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rbf_task/screen/notification/controller/notification_controller.dart';
import 'package:rbf_task/screen/notification/widgets/heads_up_notification.dart';
import 'package:rbf_task/screen/notification/widgets/notification_details.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _notificationController = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("notification screen"),
            actions: [
              Obx(
                () => _notificationController.isEditSelected.value
                    ? TextButton(
                        onPressed: () {
                          _notificationController.isEditSelected.value = false;
                          _notificationController.setUpdate();
                        },
                        child: Text("cancel"))
                    : IconButton(
                        onPressed: () {
                          _notificationController.isEditSelected.value = true;
                          _notificationController.setUpdate();
                        },
                        icon: Icon(Icons.edit)),
              )
            ],
          ),
          bottomNavigationBar: bottomNavigationBar(),
          body: Obx(
            () => ListView.separated(
              itemCount: _notificationController.notificationList.length + 1,
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                if (index < _notificationController.notificationList.length) {
                  return NotificationDetails(
                    index: index,
                  );
                } else {
                  _notificationController.getNotificationByPagination();
                  return _notificationController.pageNumber !=
                          _notificationController.pageSize
                      ? SpinKitCircle(
                          color: Colors.green,
                        )
                      : Container();
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget bottomNavigationBar() {
    return _notificationController.isEditSelected.value
        ? Container(
            height: 60,
            width: double.maxFinite,
            child: Row(
              children: [
                Checkbox(
                    value: _notificationController.selectAll,
                    onChanged: (bool? value) {
                      _notificationController.setSelectAllFunc(value!);
                    }),
                Text(
                  "All",
                  style: TextStyle(color: Colors.black),
                ),
                Spacer(flex: 3),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _notificationController.deleteNotification();
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _notificationController.updateMarkAsRead();
                      },
                      child: Text(
                        "Mark as read",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          )
        : Container(
            height: 1,
          );
  }
}
