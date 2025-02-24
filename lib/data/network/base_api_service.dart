import 'dart:convert';

import 'package:http/http.dart' show Client,  Response;

class BaseApiService {
  final Client _client;
  BaseApiService(this._client);

  Future<Response> postApi(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _client.post(url, headers: headers, body: body, encoding: encoding);
  }

  Future<Response> getApi(Uri url, {Map<String, String>? headers}) async {
    return _client.get(url, headers: headers);
  }
}
