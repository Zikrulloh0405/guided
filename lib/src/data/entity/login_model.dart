import "dart:convert";

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {

  LoginModel({
    required this.message,
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"] as String,
        code: json["code"] as int,
      );

  final String message;
  final int code;

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}
