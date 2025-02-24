import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:silent_moon/data/app_exception.dart';
import 'package:silent_moon/data/network/base_api_service.dart';
import 'package:http/http.dart' show Client, Response;

class NetworkApiService implements BaseApiService {
  final Client _client;
  NetworkApiService(this._client);

  @override
  Future<dynamic> getApi(Uri url, {Map<String, String>? headers}) async {
    try {
      final response = await _client
          .get(url, headers: headers)
          .timeout(Duration(seconds: 5));
      return jsonResponse(response);
    } on SocketException catch (_) {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on AppException catch (e, _) {
      throw AppException(message: e.message);
    } catch (_) {
      throw AppException();
    }
  }
}

dynamic jsonResponse(Response response) {
  log("statusCode : ${response.statusCode}");
  log("body : ${response.body}");
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 404:
      throw UserNotFoundException();
    default:
      throw AppException();
  }
}
