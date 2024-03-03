import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:rbf_task/screen/data/api/api_client.dart';
import 'package:rbf_task/screen/data/base_urls.dart';
import 'package:rbf_task/screen/notification/models/notification_model.dart';

class NotificationRepo {
  static Future<NotificationModel> getNotificationByPagination(
      {required int page, required int size}) async {
    try {
      dio.Response response = await ApiClient.get(
          url: BaseUrls.notificationUrl(page: page, size: size));
      if (response.statusCode == 200) {
        return NotificationModel.fromJson(response.data);
      } else {
        throw '${response.statusMessage}';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<NotificationModel> updateNotificationReadRepo(
      {required List<int> selectedNotifications}) async {
    var jsonData = {
      'notification_Ids': jsonEncode(selectedNotifications),
      'status': "Read",
    };

    try {
      dio.Response response = await ApiClient.post(
          url: BaseUrls.updateToReadUrl, playload: jsonData);
      if (response.statusCode == 200) {
        return NotificationModel.fromJson(response.data);
      } else {
        throw '${response.statusMessage}';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<NotificationModel> deleteNotificationsRepo(
      {required List<int> selectedNotifications}) async {
    var jsonData = {
      'notification_Ids': selectedNotifications,
      'status': "Delete",
    };
    print(jsonData);

    try {
      dio.Response response = await ApiClient.post(
          url: BaseUrls.updateToReadUrl, playload: jsonData);
      if (response.statusCode == 200) {
        return NotificationModel.fromJson(response.data);
      } else {
        throw '${response.statusMessage}';
      }
    } catch (e) {
      rethrow;
    }
  }
}
