import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyLoginData = "login";

Dio addInterceptor(Dio dio) {
  final tokenHelper = GetIt.instance.get<RefreshTokenHelper>();
  dio.interceptors.add(
      PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
  ));
  dio.interceptors.add(
      InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = tokenHelper.getToken();
      // final lang = tokenHelper.getLang();
      print("language inter=> $token");
      // if (lang != null) {
      //   options.headers["Accept-Language"] = lang;
      //   log('LANG IS $lang');
      // }
      if (token != null) {
        options.headers['Authorization'] = "Bearer $token";
        log('TOKEN IS $token');
        return handler.next(options);
      }
      return handler.next(options);
    },
    onError: (e, handler) async {
      if ((e.response?.statusCode == 403 || e.response?.statusCode == 401)) {
        final isTokenRefreshed = await tokenHelper.updateToken().future;
        log('refreshing token $isTokenRefreshed');
        if (isTokenRefreshed) {
          return handler.resolve(
            await _retry(e.requestOptions),
          );
        } else {
          return handler.next(e);
        }
      }
      return handler.next(e);
    },
  ));
  return dio;
}

_retry(RequestOptions requestOptions) {
  final client = GetIt.instance.get<Dio>();
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return client.request(
    requestOptions.path,
    data: requestOptions.data,
    queryParameters: requestOptions.queryParameters,
    options: options,
  );
}

class RefreshTokenHelper {
  final requests = <Completer<bool>>[];
  bool isRefreshing = false;

  Completer<bool> updateToken() {
    final completer = Completer<bool>();
    requests.add(completer);
    if (!isRefreshing) {
      isRefreshing = true;
      _updateToken();
    }
    return completer;
  }

  Future<bool> _updateToken() async {
    try {
      // await loginRepo.refresh();
      completeRefesh(true);
      return true;
    } catch (e) {
      completeRefesh(false);
      return false;
    }
  }

  void completeRefesh(bool isRefreshed) {
    isRefreshing = false;
    for (var element in requests) {
      element.complete(isRefreshed);
    }
    requests.clear();
  }

  String? getToken() {
    final prefs = GetIt.instance.get<SharedPreferences>();
    final tokenJson = prefs.getString(keyLoginData);
    if (tokenJson != null) {
      return tokenJson;
    }
    return null;
  }
}
