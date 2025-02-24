import 'package:silent_moon/model/counter/user_model.dart';

class UserListResponseModel {
    final int? page;
    final int? perPage;
    final int? total;
    final int? totalPages;
    final List<UserModel>? users;
    final Support? support;

    UserListResponseModel({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.users,
        this.support,
    });

    factory UserListResponseModel.fromJson(Map<String, dynamic> json) => UserListResponseModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        users: json["data"] == null ? [] : List<UserModel>.from(json["data"]!.map((x) => UserModel.fromJson(x))),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
        "support": support?.toJson(),
    };
}




class Support {
    final String? url;
    final String? text;

    Support({
        this.url,
        this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
