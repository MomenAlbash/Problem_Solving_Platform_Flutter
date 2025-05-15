import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://testproj.runasp.net/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  Future<dynamic> get({required String Url, @required String? token}) async {
    try {
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll({'Authorization': ' $token'});
      }
      Response response = await dio.get(Url);
      return response.data;
    } on DioException catch (e) {
      throw Exception('there is a problem in status Code');
    } catch (e) {
      throw Exception("there is an error");
    }
  }
  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    try {
      if (body is Set) {
        body = body.toList();
      }

      Response response = await Api.dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log('❌ DioException: ${e.toString()}');

      dynamic responseData = e.response?.data;

      log('📦 Raw Response: ${e.response?.data}');
      log('🧪 Type: ${e.response?.data.runtimeType}');

      // التأكد إذا كان String ثم تحويله إلى Map
      if (responseData is String) {
        try {
          responseData = jsonDecode(responseData);
          log('✅ Decoded JSON: $responseData');
        } catch (jsonError) {
          log('❌ JSON decode failed: $jsonError');
        }
      }

      // استخراج الرسالة
      final errorMessage = responseData is Map && responseData['message'] != null
          ? responseData['message']
          : 'Unknown error occurred';

      log('⚠️ Error Message: $errorMessage');
      throw (errorMessage);
    } catch (e) {
      log('❓ Unknown Error in POST $url: $e');
      throw Exception('Unknown error occurred');
    }
  }

  put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    try {
      Map<String, String> headers = {};
      headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      Response response = await dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('there is a problem in status code ');
    } catch (e) {
      throw Exception('oops there is an error , try later');
    }
  }
}
