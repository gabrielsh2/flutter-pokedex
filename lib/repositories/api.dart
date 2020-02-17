import 'package:dio/dio.dart';

abstract class Request {
  static Future<dynamic> get(String url) async {
    try {
      Response response = await Dio().get(url);
      return response.data;
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  static Future<dynamic> getJson(String url) async {
    try {
      Response response = await Dio().get(url);
      return response.toString();
    } on Exception catch (e) {
      print('Error: $e');
    }
  }
}
