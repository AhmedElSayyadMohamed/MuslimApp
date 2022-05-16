import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.get(endpoint);
  }

  static Future<List<dynamic>> readJson({
    required String jsonPath,
  }) async {
    final String response = await rootBundle.loadString(jsonPath);
    final data = await json.decode(response);

    return data;
  }
}

//"http://api.alquran.cloud/v1/quran/ar.alafasy",
