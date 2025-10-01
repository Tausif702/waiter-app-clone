import 'package:dio/dio.dart';
import 'package:waiter/core/ApiConstants.dart';
import 'package:waiter/utils/utiles.dart';
import 'package:waiter/utils/utiles.dart';
import 'package:waiter/utils/utiles.dart';
import '../../utils/sharedPreference.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  )) {
    // Interceptor add karna
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("--> API Request -->");
        print("URL: ${options.baseUrl}${options.path}");
        Utils.printRequest("Headers: ${options.headers}");
        Utils.printRequest("Body: ${options.data}");
        Utils.printRequest("--> END Request -->");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        Utils.printResponse("<-- API Response <--");
        Utils.printResponse("Status Code: ${response.statusCode}");
        Utils.printResponse("Data: ${response.data}");
        Utils.printResponse("<-- END Response <--");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        Utils.printError("<-- API Error <--");
        Utils.printError("Error: ${e.message}");
        if (e.response != null) {
          Utils.printError("Status Code: ${e.response?.statusCode}");
          Utils.printError("Data: ${e.response?.data}");
        }
        Utils.printError("<-- END Error <--");
        return handler.next(e);
      },
    ));
  }

  Future<Response> postRequest({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final mergedHeaders = await _mergeHeaders(headers);
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: mergedHeaders),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final mergedHeaders = await _mergeHeaders(headers);
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: mergedHeaders),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final mergedHeaders = await _mergeHeaders(headers);
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: mergedHeaders),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final mergedHeaders = await _mergeHeaders(headers);
      final response = await _dio.delete(
        url,
        data: data,
        options: Options(headers: mergedHeaders),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Helper to merge token header with any passed headers
  Future<Map<String, String>> _mergeHeaders(Map<String, String>? headers) async {
    final token = await SharedPref.getString(PrefKeys.userToken);
    final Map<String, String> merged = {};

    if (token.isNotEmpty) {
      merged['access_token'] = '$token';
    }

    if (headers != null) {
      merged.addAll(headers);
    }

    return merged;
  }
}
