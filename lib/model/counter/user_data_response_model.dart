import 'package:silent_moon/model/counter/user_model.dart';

class UserDataResponseModel {
  final UserModel? data;
  final Support? support;

  UserDataResponseModel({this.data, this.support});

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return UserDataResponseModel(
      data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
      support:
          json["support"] == null ? null : Support.fromJson(json["support"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "support": support?.toJson(),
  };
}


class Support {
  final String? url;
  final String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) =>
      Support(url: json["url"], text: json["text"]);

  Map<String, dynamic> toJson() => {"url": url, "text": text};
}
