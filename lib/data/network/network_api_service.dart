
import 'package:silent_moon/data/network/base_api_service.dart';
import 'package:silent_moon/res/api_strings.dart';
import 'package:http/http.dart' show Response;

class NetworkApiService {
  final BaseApiService _baseApiService;
  NetworkApiService(this._baseApiService);

  Future<Response> getUserById(int id) async {
    return await _baseApiService.getApi(Uri.parse('${ApiStrings.user}/$id'));
  }
}
