import 'dart:convert';
import 'dart:io';

import 'package:silent_moon/data/app_exception.dart';
import 'package:silent_moon/data/network/network_api_service.dart';
import 'package:silent_moon/model/counter/user_data_response_model.dart';

class CounterRepository {
  final NetworkApiService _networkApiService;
  const CounterRepository(this._networkApiService);
  Future<User> getUserById(int userId) async {
    try {
      final response = await _networkApiService.getUserById(userId);
      if (response.statusCode == 200) {
        return UserDataResponseModel.fromJson(jsonDecode(response.body)).data!;
      } else {
        throw UserNotFoundException();
      }
    } on SocketException {
      throw InternetException();
    } catch (e) {
      throw AppException();
    }
  }
}
