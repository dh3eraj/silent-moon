import 'package:silent_moon/data/app_exception.dart';
import 'package:silent_moon/data/network/network_api_service.dart';
import 'package:silent_moon/model/counter/user_data_response_model.dart';
import 'package:silent_moon/model/counter/user_list_response_model.dart';
import 'package:silent_moon/model/counter/user_model.dart';
import 'package:silent_moon/res/api_strings.dart';

class CounterRepository {
  final NetworkApiService _networkApiService;
  const CounterRepository(this._networkApiService);
  Future<UserModel> getUserById(int userId) async {
    try {
      final response = await _networkApiService.getApi(
        Uri.parse("${ApiStrings.user}/$userId"),
      );
      return UserDataResponseModel.fromJson(response).data!;
    } on AppException catch (e, _) {
      throw AppException(message: e.message);
    } catch (_) {
      throw AppException();
    }
  }

    Future<List<UserModel>?> getUsers( ) async {
    try {
      final response = await _networkApiService.getApi(
        Uri.parse(ApiStrings.user),
      );
      return UserListResponseModel.fromJson(response).users;
    } on AppException catch (e, _) {
      throw AppException(message: e.message);
    } catch (_) {
      throw AppException();
    }
  }
}
