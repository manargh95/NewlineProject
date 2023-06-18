import 'package:dio/dio.dart';

class DioHelper {
  static final DioHelper dioHelper = DioHelper();
  Dio dio = Dio();

  DioHelper() {
    dio.options.baseUrl =
        'https://newline.dev/currency/api/v1'; // Replace with your API base URL
    dio.options.connectTimeout = 2000 as Duration?; //
    dio.options.receiveTimeout = 2000 as Duration?;
    dio.options.responseType = ResponseType.json;
    //
  }


  Future<Response> fromJson(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<Response> toJson(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void dispose() {
    dio.close();
  }
}
