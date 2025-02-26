class MessageModel {
  final String message;
  final DateTime datetime;
  final bool fromServer;

  MessageModel({
    required this.message,
    required this.datetime,
    required this.fromServer,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    message: json["message"],
    datetime: json["datetime"],
    fromServer: json["fromServer"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "datetime": datetime,
    "fromServer": fromServer,
  };
}
