import 'package:dio/dio.dart';
import 'package:rbf_task/screen/data/base_urls.dart';

class ApiClient {
  static Future<BaseOptions> getBasseOptions() async {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ${BaseUrls.token}',
      },
    );

    return options;
  }

  static Future<dynamic> get({required String url, var playload}) async {
    Dio dio = Dio(await getBasseOptions());
    var response = await dio.get(url, data: playload);
    print('\nURL: $url');
    print('Request Body: $response\n');
    return response;
  }

  static Future<dynamic> post({required String url, var playload}) async {
    Dio dio = Dio(await getBasseOptions());
    var response = await dio.post(url, data: playload);
    print('\nURL: $url');
    print('Request Body: $response\n');
    return response;
  }
}
