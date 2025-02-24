class UserDataResponseModel {
  final User? data;
  final Support? support;

  UserDataResponseModel({this.data, this.support});

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return UserDataResponseModel(
      data: json["data"] == null ? null : User.fromJson(json["data"]),
      support:
          json["support"] == null ? null : Support.fromJson(json["support"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "support": support?.toJson(),
  };
}

class User {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
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
