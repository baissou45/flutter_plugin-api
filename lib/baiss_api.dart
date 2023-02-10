library api;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'api_get.dart';
part 'api_post.dart';
part 'api_delete.dart';

class BaissApi {
  static getBaseUrl() async {
    final String response = await rootBundle.loadString('env.json');
    final data = await json.decode(response);

    if (data['APP_PROD_ENV']) {
      return data['API_PROD_BASE_URL'];
    } else {
      return data['API_DEV_BASE_URL'];
    }
  }
}
