class BaseUrls {
  static const String baseUrl = "http://sherpur.rbfgroupbd.com";
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5ODMxNTY3LCJleHAiOjE3MDk5MTc5Njd9.Vy-cKUSzrWS3eW3oPFcBTyZpdTc8RzyzKFr_PpqhQSY";

  static const String _notificationUrl =
      "${baseUrl}/get_notification?page=1&pageSize=5";
  static const String updateToReadUrl = "${baseUrl}/update_notification_status";

  static String notificationUrl({required int page, required int size}) {
    return "${baseUrl}/get_notification?page=$page&pageSize=$size";
  }
}
