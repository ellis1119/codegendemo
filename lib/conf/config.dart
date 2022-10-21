import 'package:dio/dio.dart';

class RequestConfig{
  static const baseUrl = "https://www.fastmock.site/mock/6d5084df89b4c7a49b28052a0f51c29a/test";
  static const connectTimeout = 15000;
  static const successCode = 200;
}
RequestClient requestClient = RequestClient();

class RequestClient {
  late Dio _dio;

  RequestClient() {
    _dio = Dio(
        BaseOptions(baseUrl: RequestConfig.baseUrl, connectTimeout: RequestConfig.connectTimeout)
    );
  }
  Future<dynamic> request(
      String url, {
        String method = "GET",
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers
      }) async {
    Options options = Options()
      ..method = method
      ..headers = headers;

    Response response = await _dio.request(url,
        queryParameters: queryParameters, data: data, options: options);

    return response.data;
  }

}


