import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  late final Dio _dio;
  Api() : _dio = Dio();

  Future? get({String? url}) async {
    try {
      final response = await _dio.get(url!,
          options: Options(responseType: ResponseType.plain));

      return _handleResponse(response.data);
    } on DioError catch (e) {
      debugPrint("$e");
    }
  }

  Future _handleResponse(dynamic response) async {
    if (response != null && response != "") return await json.decode(response);
  }
}
