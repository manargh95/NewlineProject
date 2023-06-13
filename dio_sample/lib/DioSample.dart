// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(BaseOptions(
//       receiveDataWhenStatusError: true,
//       baseUrl: 'http://api.mediastack.com/v1/news'
//     ));
//   }
//
//  static Future<Response> getData(String url){
//     dio!.options.headers={
//       'access_key':'17ad138ca63a84718ebdf5b5e9c013da'
//     };
//
// return dio!.get(url);
//   }
//
// }
