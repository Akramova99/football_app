// dart
// Copy code
// import 'dart:async';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// Dio addInterceptor(Dio dio) {
//   dio.interceptors.add(PrettyDioLogger(
//     request: true,
//     requestBody: true,
//     requestHeader: true,
//     responseHeader: true,
//   ));
//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest: (options, handler) {
//       // Log the language header if you want to use it
//       // final lang = "en"; // Example language code
//       // options.headers["Accept-Language"] = lang;
//       // log('LANG IS $lang');
//
//       // Add any other headers here if needed
//       return handler.next(options);
//     },
//     onError: (e, handler) async {
//       // Handle errors here if needed
//       return handler.next(e);
//     },
//   ));
//   return dio;
// }
//
// class RefreshTokenHelper {
//   // This class is kept for future token management if needed
//
//   String? getToken() {
//     final prefs = GetIt.instance.get<SharedPreferences>();
//     final tokenJson = prefs.getString(keyLoginData);
//     if (tokenJson != null) {
//       return tokenJson;
//     }
//     return null;
//   }
// }
//
// void main() async {
//   final dio = Dio();
//   addInterceptor(dio);
//
//   try {
//     final response = await dio.post(
//         'https://databaseproject-flou.onrender.com/auth/login',
//         dataCertainly! Here is the revised code with the token-related parts removed and with a focus on the basic setup for making API requests using the Dio package in Flutter:
//
//         ```dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio addInterceptor(Dio dio) {
  dio.interceptors.add(PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
  ));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Log the language header if you want to use it
      // final lang = "en"; // Example language code
      // options.headers["Accept-Language"] = lang;
      // log('LANG IS $lang');

      // Add any other headers here if needed
      return handler.next(options);
    },
    onError: (e, handler) async {
      // Handle errors here if needed
      return handler.next(e);
    },
  ));
  return dio;
}


class RefreshTokenHelper {
  // This class is kept for future token management if needed

  String? getToken() {
    final prefs = GetIt.instance.get<SharedPreferences>();
    final tokenJson = prefs.getString("login");
    if (tokenJson != null) {
      return tokenJson;
    }
    return null;
  }
}



method()async{
  try {
    final prefs = GetIt.instance.get<SharedPreferences>();
    final tokenJson = prefs.getString("registerToken");
    final response = await Dio().post(
      '/auth/login',
      data: {
        'email': 'response@gmail.com',
        'password': '12345678',
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenJson'

        },
      ),
    );
    print(response.data);
  } catch (e) {
    if (e is DioException) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      print('Error sending request!');
      print(e.toString());
    }
  }

}

