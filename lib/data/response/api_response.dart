import 'package:silent_moon/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;
  ApiResponse(this.status, this.message, this.data);
  ApiResponse.loading();
  ApiResponse.loaded(this.data);
  ApiResponse.error(this.message);

  @override
  String toString() {
    return "status : $status\nmessage : $message\ndata : $data".toString();
  }
}
