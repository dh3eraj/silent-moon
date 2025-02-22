import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:silent_moon/user_data_response_model.dart';

class UserRepository {
  final Client _client;
  UserRepository(this._client);
  Future<User> getUserById(int id) async {
    final Response response = await _client.get(
      Uri.parse("https://reqres.in/api/users/$id"),
    );
    if (response.statusCode == 200) {
      final user = UserDataResponseModel.fromJson(jsonDecode(response.body)).data;
      log(user?.toJson().toString() ?? "");
      return user!;
    } else {
      throw Exception("Something went wrong.");
    }
  }
}
