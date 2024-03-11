import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:rbf_task/screen/data/api/api_client.dart';
import 'package:rbf_task/screen/data/base_urls.dart';
import 'package:rbf_task/screen/notification/models/checkbox_model.dart';
import 'package:rbf_task/screen/notification/models/notification_model.dart'
    as notification;
import 'package:rbf_task/screen/notification/repository/notification_repo.dart';

class NotificationController extends GetxController {
  RxList notificationList = <notification.Results>[].obs;
  RxList selectedNotification = <CheckBoxModel>[].obs;

  RxBool isEditSelected = false.obs;
  bool selectAll = false;
  RxInt unreadNotifications = 0.obs;
  int pageNumber = 1;
  int pageSize = 5;

  @override
  void onInit() {
    // TODO: implement onInit
    getNotification();
    super.onInit();
  }

  setSelectAllFunc(bool value) {
    selectAll = value;
    selectedNotification.forEach((element) {
      element.isSelected = value;
    });
    update();
  }

  bool checkIsAllSelected() {
    for (var element in selectedNotification) {
      if (element.isSelected == false) {
        selectAll = false;
        return false;
      }
    }
    selectAll = true;
    return true;
  }

  setUpdate() {
    update();
  }

  getNotification() async {
    pageNumber = 1;
    pageSize = 5;
    var response = await NotificationRepo.getNotificationByPagination(
        page: pageNumber, size: pageSize);

    if (response.status == "200") {
      unreadNotifications.value = 0;
      notificationList.clear();
      selectedNotification.clear();
      response.data!.results!.forEach((element) {
        notificationList.add(element);
        if (element.readStatus == 'No') unreadNotifications.value++;
        selectedNotification.add(CheckBoxModel(id: element.id!));
      });
      print(notificationList.length);
    } else {
      print("${response.message}");
    }
  }

  getNotificationByPagination() async {
    pageNumber++;
    if (pageNumber == pageSize) return;
    var response = await NotificationRepo.getNotificationByPagination(
      page: pageNumber,
      size: pageSize,
    );

    if (response.status == "200") {
      response.data!.results!.forEach((element) {
        notificationList.add(element);
        if (element.readStatus == 'No') unreadNotifications.value++;
        selectedNotification.add(CheckBoxModel(id: element.id!));
      });
      print(notificationList.length);
    } else {
      print("${response.message}");
    }
  }

  updateMarkAsRead() async {
    List<int> selectedNotificationsId = [];
    selectedNotification.forEach((element) {
      if (element.isSelected) {
        selectedNotificationsId.add(element.id);
      }
    });

    var response = await NotificationRepo.updateNotificationReadRepo(
        selectedNotifications: selectedNotificationsId);

    if (response.status == "200") {
      print("${response.message}");
      getNotification();
    } else {
      print("${response.message}");
    }
  }

  deleteNotification() async {
    List<int> selectedNotificationsId = [];
    selectedNotification.forEach((element) {
      if (element.isSelected) {
        selectedNotificationsId.add(element.id);
      }
    });

    var response = await NotificationRepo.deleteNotificationsRepo(
        selectedNotifications: selectedNotificationsId);

    if (response.status == "200") {
      print("${response.message}");
      getNotification();
    } else {
      print("${response.message}");
    }
  }
}
