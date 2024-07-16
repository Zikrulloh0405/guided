import "dart:convert";

CheckCode checkCodeFromJson(String str) => CheckCode.fromJson(json.decode(str) as Map<String, dynamic>);

String checkCodeToJson(CheckCode data) => json.encode(data.toJson());

class CheckCode {

  CheckCode({
    this.success,
    this.data,
  });

  factory CheckCode.fromJson(Map<String, dynamic> json) => CheckCode(
    success: json["success"] as bool,
    data: json["data"] == null ? null : Data.fromJson(json["data"] as Map<String, dynamic>),
  );
  final bool? success;
  final Data? data;

  CheckCode copyWith({
    bool? success,
    Data? data,
  }) =>
      CheckCode(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {

  Data({
    this.accessToken,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"] as String,
    refreshToken: json["refreshToken"] as String,
  );
  final String? accessToken;
  final String? refreshToken;

  Data copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
